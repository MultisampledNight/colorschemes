#!/usr/bin/env python
"""
Does weird stuff to my old colorscheme format and spits out cool new shiny
base16 yaml. You'll rarely need this, and it isn't very "user-proof" anyways.
"""
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional


BASE16_TO_NAME = {
    "base00": {"background"},
    "base01": {"focus"},
    "base02": {"highlight"},
    "base03": {"placeholder", "comment"},
    "base04": {"tertiary"},
    "base05": {"secondary"},
    "base06": {"foreground"},
    "base07": {"primary", "attention"},
    "base08": {"rose", "red"},
    "base09": {"orange"},
    "base0A": {"yellow", "gold"},
    "base0B": {"green"},
    "base0C": {"cyan", "teal", "turquoise"},
    "base0D": {"blue", "indigo"},
    "base0E": {"purple", "violet", "indigo"},
    "base0F": {"pink"},
}


@dataclass
class Color:
    rgb: Optional[str] = None
    additional_info: dict[str, str] = field(default_factory=dict)


def remap_dict(source: dict[str, dict[str, str]]) -> dict[str, Color]:
    remapped = {}
    for section, colors in source.items():
        for name, value in colors.items():
            if name not in remapped:
                remapped[name] = Color()

            if section.lower() == "rgb":
                remapped[name].rgb = value
            else:
                remapped[name].additional_info[section] = value
    return remapped


def sum_up_columns(source: dict[str, Color]) -> list[str]:
    # actually I wrote this in functional style but this version looks way cleaner
    columns = set()
    for color in source.values():
        columns |= set(color.additional_info.keys())
    return sorted(list(columns), reverse=True)


def format_dict_as_base16(scheme_name: str, source: dict[str, Color]) -> str:
    formatted = f'scheme: "{scheme_name}"\n' 'author: "MultisampledNight"\n'

    summed_columns = sum_up_columns(source)
    if summed_columns:
        summed_columns_joined = "\t".join(summed_columns)
        formatted += f"#\t{summed_columns_joined}"

    formatted += "\n"

    for i in range(0, 16):
        base16_name = f"base{hex(i)[2:].rjust(2, '0').upper()}"

        color = Color()
        possible_color_names = BASE16_TO_NAME[base16_name]
        for possible_name in possible_color_names:
            if possible_name in source:
                color = source[possible_name]
                break

        if color.rgb is None:
            color.rgb = "BADC0D"
        formatted += f'{base16_name}: "{color.rgb.upper().removeprefix("#")}"'

        if summed_columns:
            formatted += " #"
            for column in summed_columns:
                color_specific_info = color.additional_info.get(column, "")
                formatted += f"\t{color_specific_info}"

        formatted += "\n"

    formatted += "\n# vim: sts=0 ts=24 sw=24 noet nowrap"
    return formatted


def json_to_base16(source: Path | str) -> str:
    if isinstance(source, Path):
        with open(source) as fh:
            parsed = json.load(fh)
    else:
        parsed = json.loads(source)

    remapped = remap_dict(parsed)

    if isinstance(source, Path):
        scheme_name = source.stem
    else:
        scheme_name = "TODO"
    base16 = format_dict_as_base16(scheme_name, remapped)

    return base16


def main(argv: list[str]):
    if not argv or "--help" in argv:
        print(
            "usage: one positional argument telling where to find the "
            "json file, base16 will be stored next to it",
            file=sys.stderr,
        )
        sys.exit(1)

    input_path = Path(argv[0])

    base16 = json_to_base16(input_path)

    output_path = input_path.with_suffix(".yaml")
    with open(output_path, "w") as fh:
        fh.write(base16)


if __name__ == "__main__":
    main(sys.argv[1:])
