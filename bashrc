# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load scripts
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/prompt

# Load localrc
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# Load RVM
[[ -s "/usr/local/lib/rvm" ]] && . "/usr/local/lib/rvm"

# reload RVM
cd ..
cd -
