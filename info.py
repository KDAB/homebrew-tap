#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

# prints packages that have an outdated version in brew than in github
# they are candidates for update.py
#

from utils import *

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

def run_command_with_output(command):
    output = os.popen(command).read()
    return output

# Gets the package version from an .rb file
def get_version_in_brew(filename):
    lines = run_command_with_output(f"brew info --formula {filename}").split('\n')

    # example: ==> kdstatemachineeditor-qt6: stable 2.0.0-beta2, HEAD
    first_line = lines[0]
    return first_line.split(' ')[3].rstrip(',')

def get_latest_version_in_github(repo, strip_tag = True):
    lines = run_command_with_output(f"gh release list --repo {repo} --limit 1").split('\n')
    # example:
    # TITLE            TYPE    TAG NAME         PUBLISHED
    # KDReports 2.3.0  Latest  kdreports-2.3.0  about 2 months ago
    version = lines[0].split('\t')[2]

    if strip_tag:
        version = version.replace('v', '')
        version = version.split('-')[-1]

    return version

def print_current_brew_versions():
    print("\nCurrent Homebrew versions:")
    for filename in formulas:
        version = get_version_in_brew(filename)
        filename = filename.ljust(30)
        print(f"{filename}: {version}")

def print_latest_github_versions():
    print("\nLatest Github versions:")
    for repo in unique_repos():
        version = get_latest_version_in_github(repo)
        repo = repo.ljust(30)
        print(f"{repo}: {version}")

def print_outdated_packages():
    print("\nOutdated packages:")
    has_outdated = False

    for filename in formulas:
        current_version = get_version_in_brew(filename)
        github_version = get_latest_version_in_github(formulas[filename]["repo"])

        if current_version != github_version:
            has_outdated = True
            filename = filename.ljust(30)
            print(f"{filename}: {current_version} => {github_version}")

    if not has_outdated:
        print("No outdated packages found")

# print_latest_github_versions()
# print_current_brew_versions()
print_outdated_packages()
