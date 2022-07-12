#!/usr/bin/env python3
# vim:tw=80:
import sys
from pathlib import Path
from typing import Optional, Dict

import yaml
from PIL import Image, ImageDraw, ImageFont
from PIL.ImageColor import getrgb


FONTNAME = "IBMPlexMono-Regular.ttf"
FONTSIZE = 25
TILE_SIZE = 150


def read_source(filename: Path) -> Optional[Dict[str, str]]:
    with open(filename) as fh:
        source = yaml.safe_load(fh)
    return source


def to_image(source: Dict[str, str]) -> Image.Image:
    """
    Walks down every entry in the source and makes an entry in the image for it.
    """
    source = dict(
        map(
            lambda item: (item[0], "#" + item[1]),
            filter(lambda item: item[0] not in ["scheme", "author"], source.items()),
        )
    )

    # find the basic colors first
    background = getrgb(source["base00"])
    foreground = getrgb(source["base06"])

    color_count = len(source.keys())
    # no matter what, we just line up all entries in two rows
    height = 2
    width = color_count / 2

    actual_size = (int(width * TILE_SIZE), int(height * TILE_SIZE))

    # actually draw every color
    font = ImageFont.truetype(FONTNAME, FONTSIZE)
    image = Image.new("RGB", actual_size, color=background)
    draw = ImageDraw.Draw(image)
    for i, (name, pretty_color) in enumerate(source.items()):
        rgb_color = getrgb(pretty_color)
        upper_text_color = background
        lower_text_color = rgb_color

        root = (
            (i % (len(source) / 2)) * TILE_SIZE,
            int(i / (len(source) / 2)) * TILE_SIZE,
        )
        subtitle_position = (root[0] + TILE_SIZE / 2, root[1] + TILE_SIZE * 0.65)
        text_position = (root[0] + TILE_SIZE / 2, root[1] + TILE_SIZE * 0.35)

        if "base00" <= name <= "base02":
            lower_text_color = upper_text_color = foreground

        draw.rectangle(
            [root[0], root[1], root[0] + TILE_SIZE, root[1] + TILE_SIZE],
            fill=rgb_color,
        )
        draw.text(
            text_position,
            text=name,
            fill=upper_text_color,
            anchor="mm",
            font=font,
        )

        draw.rounded_rectangle(
            [
                subtitle_position[0] - TILE_SIZE * 0.425,
                subtitle_position[1] - TILE_SIZE * 0.125,
                subtitle_position[0] + TILE_SIZE * 0.425,
                subtitle_position[1] + TILE_SIZE * 0.125,
            ],
            fill=background,
            radius=5,
        )
        draw.text(
            subtitle_position,
            text=pretty_color,
            fill=lower_text_color,
            anchor="mm",
            font=font,
        )

    return image


def base16_to_image(source: Path, output: Path):
    source = read_source(source)
    image = to_image(source)
    image.save(output)


def main(argv: list[str]):
    if not argv or "--help" in argv:
        print(
            "usage: give me anything base16 and I'll create an image for it "
            "in the same directory",
            file=sys.stderr,
        )
        sys.exit(1)

    source_path = Path(argv[0])

    try:
        base16_to_image(source_path, source_path.with_suffix(".png"))
    except ValueError:
        print(
            "There is no 'base00'/'base06' key!",
            file=sys.stderr,
        )
        sys.exit(2)
    except OSError:
        print("Unable to open font!", file=sys.stderr)
        sys.exit(3)


if __name__ == "__main__":
    main()
