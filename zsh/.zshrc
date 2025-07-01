# -----------------------------
# BlockLune's Zsh Configuration
# -----------------------------

# Set codepage to 65001 (UTF-8) on Windows
# See https://dominikrys.com/posts/zsh-in-git-bash-on-windows/
if [[ "$OSTYPE" == "msys" ]]; then
    chcp.com 65001 &> /dev/null
fi

# -----------------
# Zim configuration
# -----------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh 
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh 
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh


# -----------------
# Zsh configuration
# -----------------

#
# Safe environment
#

# Do not log out with <Ctrl-D>
setopt IGNORE_EOF

# Do not overwrite files via '>'
setopt NO_CLOBBER

#
# History
#

export HISTFILE=~/.zsh_history
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE 
setopt HIST_SAVE_NO_DUPS

#
# Optionally external source
#

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# env
[[ -f ~/.env ]] && source ~/.env

# utils
[[ -f ~/.utils ]] && source ~/.utils


#
# CLI initialization
#

# [mise](https://mise.jdx.dev/) 
if (( ${+commands[mise]} )) && [[ -z "${MISE_ACTIVATED:-}" ]]; then
  eval "$(mise activate zsh)"
  export MISE_ACTIVATED=1
fi

# [zoxide](https://github.com/ajeetdsouza/zoxide) 
if (( ${+commands[zoxide]} )) && [[ -z "${ZOXIDE_ACTIVATED:-}" ]]; then
  eval "$(zoxide init zsh --cmd cd)"
  export ZOXIDE_ACTIVATED=1
fi

