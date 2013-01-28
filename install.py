#!/usr/bin/env python3

# ###### Disclaimer ######
# This source code is provided "as is" and without warranties as to performance
# or merchantability. The author and/or distributors of this source code may
# have made statements about this source code. Any such statements do not
# constitute warranties and shall not be relied on by the user in deciding
# whether to use this source code.

# This source code is provided without any express or implied warranties
# whatsoever. Because of the diversity of conditions and hardware under which
# this source code may be used, no warranty of fitness for a particular purpose
# is offered. The user is advised to test the source code thoroughly before
# relying on it. The user must assume the entire risk of using the source code.

import os
import glob
import shutil


def installdotfiles():
    'Script to install dotfiles, including user interaction in install process'

    # Introduction and warnings
    print("Welcome to Colton's dotfile installation script!")
    print("Please note that existing files will be renamed with a .old",
          "extension, and existing .old files may be overwritten!")
    print("Please see disclaimer in source code before using this script.")

    # Inform user of destination, ask for permission
    response = input('\nWill install via symlinks in `~/`, continue? (y/n) ')
    if str.lower(response) != 'y':
        print('Aborting...')
        exit()

    # Ask user to install all or pick and choose
    possibilities = glob.glob('*')
    response = input('Install all? (y/n) ')
    if str.lower(response) == 'y':
        modules = [f for f in possibilities if os.path.isdir(f)]
    else:
        # Ask user which files to install, store those to install in `modules`
        modules = []
        for f in possibilities:
            if not os.path.isdir(f):
                continue
            response = input('Install ' + f + '? (y/n) ')
            if str.lower(response) == 'y':
                modules.append(f)

    # Glob all the necessary files, excluding, ironically, dotfiles
    #   Ex: will ignore .DS_STORE
    files = []
    for f in modules:
        files.extend(
            [os.path.join(f, x) for x in os.listdir(f) if x[0] != '.'])

    # Check for already-existing files, move to `$FILE`.old
    for f, path in [(os.path.split(x)[-1], x) for x in files]:
        currentpath = os.path.expanduser(os.path.join('~', '.' + f))
        if os.path.islink(currentpath):
            os.remove(currentpath)
        elif os.path.exists(currentpath):
            print(currentpath, 'exists, moving to', currentpath + '.old')
            move_to_dot_old(currentpath)

        # Install symlinks
        os.symlink(os.path.abspath(path), currentpath)

        print('Installation of', currentpath, 'complete!')


def move_to_dot_old(path):
    'Move existing path to `$PATH`.old'

    # Check for existing .old file/folder, delete if exists
    # A little unsafe, maybe make this safer later
    if os.path.exists(path + '.old'):
        if os.path.isdir(path + '.old'):
            shutil.rmtree(path + '.old')
        else:
            os.remove(path + '.old')
    os.rename(path, path + '.old')


if __name__ == '__main__':
    try:
        installdotfiles()
    except KeyboardInterrupt:
        print('Aborting...')
