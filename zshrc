# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="coltonbrackets"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew ruby osx rails)

source $ZSH/oh-my-zsh.sh


###### MY STUFF ######

# My env variables
export PATH=/usr/local/bin:/usr/bin:/usr/include:/usr/local/include:/usr/local/lib:/usr/lib:/usr/texbin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/:/Users/crakdmirror/bin:/usr/local/Cellar/python/2.7.1/bin:/usr/local/Cellar/ruby/1.9.2-p136/bin:/Applications/Doxygen.app/Contents/Resources:/Applications/Doxygen.app/Contents/MacOS:/Applications/Graphviz.app/Contents/MacOS

export EDITOR=vim
export SVN_EDITOR=vim
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='exfxcxdxbxegedabagacad'
export LANG=ru_RU.UTF-8
export BAT_CHARGE=/Users/crakdmirror/bin/batcharge.py
export VMAIL_VIM=mvim
export DOT_PATH=/Applications/Graphviz.app/Contents/MacOS
export HAVE_DOT=YES
export SHORT_NAMES=YES
export GREP_OPTIONS=

# My aliases
alias ls="ls -h"
alias la="ls -ahf"

###### /MY STUFF #####
