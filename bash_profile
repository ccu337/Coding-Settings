
# Setting PATH for Python 2.7
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Homebrew Cask - Global Applications Folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# Master Password Name
export MP_FULLNAME="Cameron Charles Unterberger"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# add bash-completion from Homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true



#-------------------------------------
# BEGIN Udacity Git Customization
#-------------------------------------

# Enable tab completion
source ~/.git-completion.bash

# colors!
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
magenta="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
white="\[\033[0;37m\]"
no_color="\[\033[0m\]"

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$yellow\u$cyan\$(__git_ps1)$white \W \$ $no_color"

#-------------------------------------
# END Udacity Git Customization
#-------------------------------------
