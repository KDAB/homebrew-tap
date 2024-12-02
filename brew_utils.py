#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

import sys, os

from ci_release_tools.src.utils import *
from ci_release_tools.src.gh_utils import *
from brew_utils import *

formulas = {
    'kddockwidgets-qt5.rb': {"repo": "KDAB/KDDockWidgets"},
    'kddockwidgets-qt6.rb': {"repo": "KDAB/KDDockWidgets"},
    'kdsingleapplication-qt5.rb': {"repo": "KDAB/KDSingleApplication"},
    'kdsingleapplication-qt6.rb': {"repo": "KDAB/KDSingleApplication"},
    'kdsoap-qt5.rb': {"repo": "KDAB/KDSoap"},
    'kdsoap-qt6.rb': {"repo": "KDAB/KDSoap"},
    'kdchart-qt5.rb': {"repo": "KDAB/KDChart"},
    'kdchart-qt6.rb': {"repo": "KDAB/KDChart"},
    'kdreports-qt5.rb': {"repo": "KDAB/KDReports"},
    'kdreports-qt6.rb': {"repo": "KDAB/KDReports"},
    'gammaray-qt5.rb': {"repo": "KDAB/Gammaray"},
    'kdmactouchbar-qt5.rb': {"repo": "KDAB/KDMacTouchBar"},
    'kdbindings.rb': {"repo": "KDAB/KDBindings"},
    'kdutils.rb': {"repo": "KDAB/KDUtils"},
    # 'kdalgorithms.rb': {"repo": "KDAB/KDAlgorithms"},
    # 'kdstatemachineeditor-qt5.rb': {"repo": "KDAB/KDStateMachineEditor"},
    # 'kdstatemachineeditor-qt6.rb': {"repo": "KDAB/KDStateMachineEditor"},
}

def unique_repos():
    seen_repos = set()
    unique_repo_list = []

    for filename in formulas:
        repo = formulas[filename]["repo"]
        if repo not in seen_repos:
            unique_repo_list.append(repo)
            seen_repos.add(repo)

    return unique_repo_list

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
    for filename in formulas:
        current_version = get_version_in_brew(filename)
        repo = formulas[filename]["repo"]
        github_version = get_latest_release_tag_in_github(repo)
        github_version_numeric = clean_version(github_version)

        # print(f"testing {repo} {current_version} {github_version_numeric}")
        if current_version != github_version_numeric:
            packages.append((filename, current_version, github_version))

    return packages
