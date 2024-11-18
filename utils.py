#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

import os

def exit_because(reason):
    print(reason)
    exit(1)

def run_command(command, fatal = True):
    if os.system(command) == 0:
        return True;

    if fatal:
        exit_because(f"Failed to run command: {command}")

    return False

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
