import subprocess
import sys


def repo_toplevel_dir() -> str:
    try:
        return subprocess.check_output(
            ["git", "rev-parse", "--show-toplevel"],
            stderr=subprocess.STDOUT,
            text=True,
        ).strip()
    except subprocess.CalledProcessError as error:
        print(f"could not get repo root: {error.output}", file=sys.stderr)
        sys.exit(1)
