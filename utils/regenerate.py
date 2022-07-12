#!/usr/bin/env python
# expects https://github.com/InspectorMustache/base16-builder-python to be installed and `pybase16 update`
import os
import shutil
import subprocess
import sys
from collections.abc import Iterable
from pathlib import Path
from tempfile import TemporaryDirectory
from utils import cd_to_toplevel, repo_toplevel_dir
from base16_to_image import base16_to_image


def cd_build():
    cd_to_toplevel()
    os.makedirs("build", exist_ok=True)
    os.chdir("build")


def update_base16_repos():
    cd_build()
    subprocess.run(["pybase16", "update"])


def custom_scheme_paths() -> Iterable[Path]:
    return map(
        lambda path: path.resolve(), (Path(repo_toplevel_dir()) / "schemes").iterdir()
    )


def inject_symlinks(reverse=False):
    cd_build()

    build_scheme_dir = Path.cwd() / "schemes"
    build_scheme_dir.mkdir(exist_ok=True)

    for custom_scheme in custom_scheme_paths():
        link_target = build_scheme_dir / custom_scheme.name
        if reverse:
            assert link_target.is_symlink()
            # ensures "cleaning up" even partial injects
            if link_target.exists():
                link_target.unlink()
        else:
            link_target.symlink_to(custom_scheme)


def build_base16():
    cd_build()

    scheme_paths = custom_scheme_paths()
    build_command = ["pybase16", "build"]
    # didn't really find an interleave function for iterators, so here goes nothing
    for path in scheme_paths:
        build_command.append("--scheme")
        build_command.append(path.stem)

    subprocess.run(build_command)


def extract_vim_colors():
    cd_build()

    def ignore_if_not_custom(dir_path, names):
        return set(
            filter(
                # a bit cursed but note that we need to return what we want to *ignore*
                lambda file_name: not any(
                    map(
                        lambda scheme_name: file_name.lower()
                        .removeprefix("base16-")
                        .startswith(scheme_name),
                        custom_scheme_names,
                    )
                ),
                names,
            )
        )

    custom_scheme_names = set(map(lambda path: path.name, custom_scheme_paths()))
    shutil.copytree(
        Path.cwd() / "output" / "vim" / "colors",
        Path(repo_toplevel_dir()) / "colors",
        ignore=ignore_if_not_custom,
        dirs_exist_ok=True,
    )


def cleanup():
    cd_build()
    shutil.rmtree(Path.cwd() / "output")


def build_images():
    cd_build()

    image_dir = Path.cwd() / "images"
    os.makedirs(image_dir, exist_ok=True)

    for scheme in custom_scheme_paths():
        base16_to_image(
            scheme / f"{scheme.stem}.yaml", image_dir / f"{scheme.stem}.png"
        )


def regenerate(argv: list[str]):
    if "--init" in argv:
        update_base16_repos()

    try:
        inject_symlinks()
        build_base16()
    except KeyboardInterrupt:
        pass
    except Exception as err:
        print(err)
    finally:
        inject_symlinks(reverse=True)

    extract_vim_colors()
    build_images()

    if "--noclean" not in argv:
        cleanup()


if __name__ == "__main__":
    regenerate(sys.argv[1:])
