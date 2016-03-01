Overview
--------

This repo contains most of my major system configuration files ("dotfiles").
Use at your own risk.  Feel free to comment if you don't understand any
particular piece.

Requirements
------------

If you're using OSX, you must have the coreutils package install via homebrew
in order to use this as-is, as it aliases ls to gls by default (for 256
ls-colors using dircolors).

Use
---

I create symlinks for all my configuration files which point to my local clone
of this repository.  I find this to be the best way, because after some fairly
simple setup, it's virtually seamless, and fairly pain-free to keep it up to
date.

I've provided an install script, use at your own risk.  Python 3 must be
installed on your system in order to use the script.  Just type ./install.sh
from the root directory of the repository, and it will symlink the files of
your choosing into your home directory. Read the disclaimer in the script
source code before using.

I now use plug.vim for my plugins instead of submodules/pathogen. The plugins
should install the first time you run vim after cloning the repo. If this
breaks for some reason, use `:PlugInstall` inside of vim to manually install
the plugins

License
-------

Feel free to use any of the content to add to your own configuration, or even
to just fork my repository and make it your own.

Comments/Questions/Criticism
----------------------------

Please feel free to use the issue tracker for suggestions or bug reports.  I'm
always looking for new ways to enhance my dotfiles.
