# My bash configuration file
# References:
# - https://lift.cs.princeton.edu/java/.bashrc

MAX_PROMPT_LEN=35

getPrompt() {
    currentWorkingDir=${PWD/#$HOME/\~}
    if (( ${#currentWorkingDir} > $MAX_PROMPT_LEN )); then
        currentWorkingDir=.../${PWD##*/}   
    fi
}

PROMPT_COMMAND=getPrompt

if [ "$TERM" = "xterm-color" ] || [ "$TERM" = "xterm-256color" ]; then

    # Use color if terminal supports it.
    BLACK="\[$(tput setaf 0)\]"
    RED="\[$(tput setaf 1)\]"
    GREEN="\[$(tput setaf 2)\]"
    YELLOW="\[$(tput setaf 3)\]"
    BLUE="\[$(tput setaf 4)\]"
    MAGENTA="\[$(tput setaf 5)\]"
    CYAN="\[$(tput setaf 6)\]"
    WHITE="\[$(tput setaf 7)\]"
    DEFAULT="\[$(tput sgr0)\]"
 
    export PS1="${BLUE}\${currentWorkingDir}> ${DEFAULT}"
else
    export PS1="\${currentWorkingDir}> "
fi

# Establish a safe environment.
set -o ignoreeof         # Do not log out with <Ctrl-D>.
set -o noclobber         # Do not overwrite files via '>'.

# When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend

# Make the command-line history ignore duplicate command lines.
export HISTCONTROL=erasedups:ignoredups

# Make the command-line history show dates and times.
export HISTTIMEFORMAT="%F %T "

# Support non-ASCII characters in terminal.
# Note: use LC_ALL='C' if you want sort to behave in expected way.
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# Suppress OS X warning to change default shell to zsh.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set Windows codepage to 65001 (UTF-8).
if [[ "$OSTYPE" == "msys" ]]; then
    chcp.com 65001
fi

# env
if [ -f ~/.env ]; then
    source ~/.env
fi

# aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# utils
if [ -f ~/.utils ]; then
    source ~/.utils
fi
