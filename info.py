#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

# prints packages that have an outdated version in brew than in github
# they are candidates for update_all.py

import sys
from brew_utils import *

def print_current_brew_versions():
    print("\nCurrent Homebrew versions:")
    for filename in get_formula_filenames():
        version = get_version_in_brew(filename)
        filename = filename.ljust(30)
        print(f"{filename}: {version}")

def print_latest_github_versions():
    print("\nLatest Github versions:")
    for repo in repos():
        version = get_latest_release_tag_in_github(repo)
        repo = repo.ljust(30)
        print(f"{repo}: {version}")

def print_outdated_packages():
    outdated_packages = get_outdated_packages()
    has_outdated = outdated_packages != []

    if has_outdated:
        print("\nOutdated packages:")

    for outdated in outdated_packages:
        filename = outdated[0].ljust(30)
        print(f"{filename}: {outdated[1]} => {outdated[2]}")

    if not has_outdated:
        print("No outdated packages found")

#print_latest_github_versions()
#print_current_brew_versions()
print_outdated_packages()
