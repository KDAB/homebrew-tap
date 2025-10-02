#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
#
# Script called by CI to update any outdated package, or to print outdated packages.

import sys
import os
from pathlib import Path

sys.path.append(str(Path(__file__).parent / "ci_release_tools" / "src"))

from ci_release_tools.src.utils import *
from brew_utils import *


def print_usage():
    print(f"""Usage: {os.path.basename(sys.argv[0])} [--print-outdated-only] [--help]
Options:
  --print-outdated-only   Print the list of outdated packages and exit.
  --help                  Show this help message and exit.
""")


def main():
    args = sys.argv[1:]
    if "--help" in args:
        print_usage()
        sys.exit(0)

    outdated_packages = get_outdated_packages()

    if "--print-outdated-only" in args:
        for package in outdated_packages:
            filename = package[0]
            new_tag = package[2]
            print(f"{filename} -> {new_tag}")
        sys.exit(0)

    for package in outdated_packages:
        filename = package[0]
        new_tag = package[2]
        if not run_command(
            f"./update_one.py {filename} {new_tag} --pr KDAB/homebrew-tap"
        ):
            exit_because("Failed to run update_one.py")

    sys.exit(0)


if __name__ == "__main__":
    main()
