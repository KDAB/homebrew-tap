#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

import sys, os, tomllib
from pathlib import Path

sys.path.append(str(Path(__file__).parent / "ci_release_tools" / "src"))
from ci_release_tools.src.utils import *
from ci_release_tools.src.gh_utils import *
from brew_utils import *


def get_projects():
    with open('ci_release_tools/releasing.toml', 'rb') as f:
        global formulas
        toml_content = tomllib.load(f)
        return toml_content['project']


# Returns a list like; ['KDAB/KDSoap', 'KDAB/KDReports']
def repos():
    repo_list = []
    projects = get_projects()
    for p in projects:
        if 'homebrew' in projects[p] and projects[p]['homebrew']:
            repo_list.append(f"KDAB/{p}")

    return repo_list

# Returns the list of .rb filenames
def get_formula_filenames():
    filenames = []
    projects = get_projects()
    for p in projects:
        if 'homebrew' in projects[p] and projects[p]['homebrew']:
            filenames.extend(projects[p]['homebrew'])
    return filenames

# Gets the package version from an .rb file
def get_version_in_brew(filename):
    lines = run_command_with_output(f"brew info --formula {filename}").split('\n')

    # example: ==> kdstatemachineeditor-qt6: stable 2.0.0-beta2, HEAD
    first_line = lines[0]
    return first_line.split(' ')[3].rstrip(',')

# removes v suffix and stuff like that
def clean_version(version):
    version = version.replace('v', '')
    version = version.split('-')[-1]
    return version

# Returns the url of the tar.gz
def get_url(filename) -> str:
    try:
        with open(filename, 'r') as f:
            for line in f:
                if 'url' in line.lower():
                    url = line.split('"')[1]  # Extract URL between quotes
                    return url
    except Exception as e:
        exit_because(f"Error reading file: {e}")

    exit_because("Could not find url in file")
    return ""

# returns the packages that need upgrading
# the result is a list of tuples, for example:
# [('kdmactouchbar-qt5.rb', 'v1.0.0', 'v1.1.3')]
def get_outdated_packages():
    packages = []
    projects = get_projects()

    for project_name, project_data in projects.items():
        if 'homebrew' not in project_data:
            continue

        filenames = project_data['homebrew']
        for filename in filenames:
            current_version = get_version_in_brew(filename)
            repo = f"KDAB/{project_name}"
            github_version = get_latest_release_tag_in_github(repo)
            github_version_numeric = clean_version(github_version)

            # print(f"testing {repo} {current_version} {github_version_numeric}")
            if current_version != github_version_numeric:
                packages.append((filename, current_version, github_version))

    return packages
