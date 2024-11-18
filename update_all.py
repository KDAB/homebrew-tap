#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
#
# Script called by CI to update any outdated package

from utils import *

outdated_packages = get_outdated_packages()

for package in outdated_packages:
    filename = package[0]
    new_tag = package[2]
    if not run_command(f"./update_one.py {filename} {new_tag} --pr KDAB/homebrew-tap"):
        exit_because("Failed to run update_one.py")

exit(0)
