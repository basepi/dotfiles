Overview
--------

This repo contains most of my major system configuration files ("dotfiles").
As long as I was putting them in a git repo, I figured I may as well post them
online so that I can share the tricks I've found, and maybe learn a few tricks
from you as well!  Enjoy!

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

*UPDATE*: Install script is done, use at your own risk.  Python 3 must be
installed on your system in order to use the script.  Just type ./install.sh
from the root directory of the repository, and it will symlink the files of
your choosing into your home directory. Read the disclaimer in the script
source code before using.

Additionally, you should run the following commands to get all the plugins for
vim (run from the root of the repo):

    git submodule init
    git submodule update

To update the plugins, run:

    git submodule foreach git pull

License
-------

Feel free to use any of the content to add to your own configuration, or even
to just fork my repository and make your own it your own.  My only request is
that you send me a link with your new fork (unless it's on Github, in which
case, it'll show up anyway), so I can check out what you do differently.  I
love tinkering with my configs, and am very interested in how other people
configure their systems

Comments/Questions/Criticism
----------------------------

I'm always looking for cool new ideas of things to add to my configuration
files.  I'm a born tinkerer.  (I often spend more time configuring vim than
actually working in it)  =P  So please use the issue tracker to suggest things
I could add to my configuration files, or feel free to submit pull requests if
you fork the repository.  Enjoy!  =)
