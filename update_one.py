#!/usr/bin/env python3
# SPDX-License-Identifier: MIT

# Script to update the url and sha of the package
# example usage: ./update.py kdreports-qt5.rb v2.3.0

# to open a PR against KDAB tap (origin):
# ./update.py kdreports-qt5.rb 2.3.0 --pr KDAB/homebrew-tap --remote origin

# to open a PR against your test tap:
# ./update.py kdreports-qt5.rb 2.3.0 --pr iamsergio/homebrew-tap --remote sergio

import argparse, os
import hashlib
from utils import *

# Returns the sha256 of the .tar.gz file
def get_tarball_sha256(url):
    tar_filename = "/tmp/temp.tar.gz"
    print(f"Calculating sha1 for {url} ...")
    run_command(f'curl -f -L -o {tar_filename} {url}')

    sha256_hash = hashlib.sha256()
    with open(tar_filename, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b''):
            sha256_hash.update(chunk)

    os.remove(tar_filename)
    return sha256_hash.hexdigest()

def get_new_url(old_url, new_tag):
    if '/archive/' in old_url:
        # Example: https://github.com/KDAB/KDStateMachineEditor/archive/v2.0.0.tar.gz
        return old_url.rsplit('/', 1)[0] + '/' + new_tag + '.tar.gz'
    elif '/releases/download/' in old_url:
        # Example: https://github.com/KDAB/KDSingleApplication/releases/download/v1.1.0/kdsingleapplication-1.1.0.tar.gz
        pkg_name = old_url.split('/')[-1].split('-')[0]

        if pkg_name in new_tag:
            # KDSoap/KDReports have tags like kdreports-2.2.0, here we don't prefix package name
            tar_filename = new_tag + '.tar.gz'
        else:
            pkg_version = new_tag.lstrip('v')
            tar_filename = pkg_name + '-' + pkg_version + '.tar.gz'

        return old_url.rsplit('/', 2)[0] + '/' + new_tag + '/' + tar_filename

# updates the url and sha1 and returns whether the file was edited or not
def update(filename, new_tag) -> bool:
    url = get_url(filename)

    # set the new url
    url = get_new_url(url, new_tag)
    sha = get_tarball_sha256(url)

    with open(filename, 'r') as f:
        old_content = f.read()

    new_content = old_content.replace(old_content.split('url "')[1].split('"')[0], url)
    new_content = new_content.replace(new_content.split('sha256 "')[1].split('"')[0], sha)

    with open(filename, 'w') as f:
        f.write(new_content)

    return new_content != old_content

# opens a pull request against filename
def create_pr(filename, remote, repo, tagname):

    is_logged_in = run_command("gh auth status", fatal=False)
    if not is_logged_in:
        exit_because("Login to gh first")

    has_changes = os.system(f'git diff --quiet {filename}') != 0
    if not has_changes:
        exit_because(f"ERROR: File does not have changes: {filename}")

    package_name = os.path.splitext(os.path.basename(filename))[0]
    commit_msg = f"Update package {package_name} to {tagname}"
    tmp_branch = f"{package_name}/{tagname}"

    run_command(f"git checkout -B {tmp_branch}")
    run_command(f"git add {filename}")
    run_command(f"git commit -m \"{commit_msg}\"")
    run_command(f"git push {remote} {tmp_branch}")
    run_command(f"git branch --set-upstream-to={remote}/{tmp_branch}")
    run_command(f"gh pr create --title \"{commit_msg}\" -R {repo} -B master -b \"bump\"")

parser = argparse.ArgumentParser()
parser.add_argument('filename', help="filename to diagnose")
parser.add_argument('tag', help="tag to diagnose for")
parser.add_argument('--pr', help="repository to create PR for")
parser.add_argument('--remote', help="Git remote", default="origin")

args = parser.parse_args()

script_dir = os.path.dirname(os.path.abspath(__file__))

full_path = os.path.abspath(args.filename)
if not full_path.startswith(script_dir) or not os.path.exists(args.filename):
    print("Error: File '%s' must be inside the script directory" % args.filename)
    exit(1)

if update(args.filename, args.tag):
    print("\nFile edited successfully!")

    if args.pr is not None:
        print(f"Opening pr in {args.pr} ...")
        create_pr(args.filename, args.remote, args.pr, args.tag)
else:
    print("\nNo changes made")
