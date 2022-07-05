#!/usr/bin/env python3
# Uses a lot of the HSP color model, see https://alienryderflex.com/hsp.html
#
# NOTE to future readers: The HSP color model doesn't really hold what it
# promises, consider using L*a*b or LCH instead
import json
from copy import deepcopy
from math import sqrt
from pathlib import Path
from typing import Tuple, Dict

BASE_FILE = Path(__file__).resolve().parent / "config.json"
# NOTE: format doesn't match what json-to-image expects!
OUTPUT_FILE = Path(__file__).resolve().parent / "unsweetened.json"
PR = 0.299
PG = 0.587
PB = 0.114
START_FOREGROUND_COLOR = "\033[38;2;{};{};{}m"
START_BACKGROUND_COLOR = "\033[48;2;{};{};{}m"
END_COLOR = "\033[0m"


class RgbColor:
    def __init__(self, r: float, g: float, b: float):
        self.r = r
        self.g = g
        self.b = b

    def as_byte_tuple(self) -> Tuple[int, int, int]:
        """
        Returns this color in an (R, G, B) tuple, all values being in the range
        [0-255].
        """
        return tuple(
            map(lambda value: int(value * 255), iter((self.r, self.g, self.b)))
        )

    def __str__(self) -> str:
        return "#" + "".join(
            map(lambda value: hex(value)[2:].rjust(2, "0"), iter(self.as_byte_tuple()))
        )

    def __repr__(self) -> str:
        return str(self)

    def perceived_brightness(self):
        return sqrt(PR * self.r**2 + PG * self.g**2 + PB * self.b**2)


class HspColor:
    def __init__(self, h: float, s: float, p: float):
        self.h = h
        self.s = s
        self.p = p

    def into_rgb(self) -> RgbColor:
        """
        Translates from the HSP color model to the RGB color model, all components
        are assumed to be between 0.0 and 1.0.
        """
        # translating this from C was a bit of a pain, I hope it's correct
        color = RgbColor(0.0, 0.0, 0.0)
        h, s, p = self.h, self.s, self.p
        min_over_max = 1.0 - s

        if min_over_max > 0.0:
            part = 1.0 + h * (1.0 / min_over_max - 1.0)
            if h < 1.0 / 6:
                h = 6.0 * (h - 0.0 / 6)
                color.b = p / sqrt(
                    PR / min_over_max / min_over_max + PG * part**2 + PB
                )
                color.r = color.b / min_over_max
                color.g = color.b + h * (color.r - color.b)
            elif h < 2.0 / 6:
                h = 6.0 * (-h + 2.0 / 6)
                color.b = p / sqrt(
                    PG / min_over_max / min_over_max + PR * part**2 + PB
                )
                color.g = color.b / min_over_max
                color.r = color.b + h * (color.g - color.b)
            elif h < 3.0 / 6:
                h = 6.0 * (h - 2.0 / 6)
                color.r = p / sqrt(
                    PG / min_over_max / min_over_max + PB * part**2 + PR
                )
                color.g = color.r / min_over_max
                color.b = color.r + h * (color.g - color.r)
            elif h < 4.0 / 6:
                h = 6.0 * (-h + 4.0 / 6)
                color.r = p / sqrt(
                    PB / min_over_max / min_over_max + PG * part**2 + PR
                )
                color.b = color.r / min_over_max
                color.g = color.r + h * (color.b - color.r)
            elif h < 5.0 / 6:
                h = 6.0 * (h - 4.0 / 6)
                color.g = p / sqrt(
                    PB / min_over_max / min_over_max + PR * part**2 + PG
                )
                color.b = color.g / min_over_max
                color.r = color.g + h * (color.b - color.g)
            else:
                h = 6.0 * (-h + 6.0 / 6)
                color.g = p / sqrt(
                    PR / min_over_max / min_over_max + PB * part**2 + PG
                )
                color.r = color.g / min_over_max
                color.b = color.g + h * (color.r - color.g)
        else:
            if h < 1.0 / 6:
                h = 6.0 * (h - 0.0 / 6)
                color.r = sqrt(p**2 / (PR + PG * h**2))
                color.g = color.r * h
            elif h < 2.0 / 6:
                h = 6.0 * (h - 2.0 / 6)
                color.g = sqrt(p**2 / (PG + PR * h**2))
                color.r = color.g * h
            elif h < 3.0 / 6:
                h = 6.0 * (h - 2.0 / 6)
                color.g = sqrt(p**2 / (PG + PB * h**2))
                color.b = color.g * h
            elif h < 4.0 / 6:
                h = 6.0 * (h - 4.0 / 6)
                color.b = sqrt(p**2 / (PB + PG * h**2))
                color.g = color.b * h
            elif h < 5.0 / 6:
                h = 6.0 * (h - 4.0 / 6)
                color.b = sqrt(p**2 / (PB + PR * h**2))
                color.r = color.b * h
            else:
                h = 6.0 * (h - 6.0 / 6)
                color.r = sqrt(p**2 / (PR + PB * h**2))
                color.b = color.r * h

        # I know this solution is far from perfect, actually we'd have to
        # respect perceived brightness and handle over all colors, but this one
        # works well enough
        max_value = max(color.r, color.g, color.b)
        if max_value > 1:
            color.r /= max_value
            color.g /= max_value
            color.b /= max_value

        return color


def parse_hsp_color(source: Dict[str, float]) -> HspColor:
    return HspColor(
        source["hue"] / 360,
        source["saturation"] / 100,
        source["brightness"] / 100,
    )


def find_accents(
    hues: Dict[str, float], saturation: float, brightness: float
) -> Dict[str, RgbColor]:
    """
    Finds all colors with the given hues, perceived brightness and saturations.
    """
    colors = {}
    for name, hue in hues.items():
        color = HspColor(hue / 360, saturation, brightness).into_rgb()
        colors[name] = color
    return colors


def find_shadings(base_color: HspColor, difference: float) -> Dict[str, RgbColor]:
    """
    Finds the two shadings offsetting from the given base color with the given
    difference.
    """
    secondary = deepcopy(base_color)
    secondary.p -= difference
    primary = deepcopy(base_color)
    primary.p += difference
    return {
        "secondary": secondary.into_rgb(),
        "primary": primary.into_rgb(),
    }


def find_highlight(background: HspColor, difference: float) -> Dict[str, RgbColor]:
    """
    Finds a highlight copy by taking the background color in and a given
    difference in perceived brightness.
    """
    highlight = deepcopy(background)
    highlight.p += difference
    return {
        "highlight": highlight.into_rgb(),
    }


def print_colors(
    background: RgbColor, foreground: RgbColor, colors: Dict[str, RgbColor]
):
    """
    Pretty-prints the given colors, line by line, with hex codes and ANSI escape
    codes.
    """
    for name, color in colors.items():
        if background == color:
            current_background = foreground
        else:
            current_background = background
        print(
            f"{START_BACKGROUND_COLOR.format(*current_background.as_byte_tuple())}"
            f"{START_FOREGROUND_COLOR.format(*color.as_byte_tuple())}"
            f"{name.rjust(16)} "
            f"{color} "
            f"{START_BACKGROUND_COLOR.format(*color.as_byte_tuple())}"
            f"{' ' * 7}"
            f"{END_COLOR}"
        )


def main():
    with open(BASE_FILE) as fh:
        base = json.load(fh)
    background = parse_hsp_color(base["background"])
    background_rgb = background.into_rgb()
    foreground = parse_hsp_color(base["foreground"])
    foreground_rgb = foreground.into_rgb()

    colors = {"background": background_rgb, "foreground": foreground_rgb}
    colors |= find_accents(base["hue"], base["saturation"], foreground.p)
    colors |= find_shadings(foreground, base["shading_difference"])
    colors |= find_highlight(background, base["highlight_difference"])

    print_colors(background_rgb, foreground_rgb, colors)

    with open(OUTPUT_FILE, "w") as fh:
        json.dump({name: str(color) for name, color in colors.items()}, fh, indent=4)


if __name__ == "__main__":
    main()

# vim:tw=80:
