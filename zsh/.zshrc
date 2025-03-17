# BlockLune's Zsh Configuration
#
# Framework:
# - [oh-my-zsh](https://ohmyz.sh/)
#
# Theme:
# - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
#
# Plugins:
# - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
# - [fzf-tab](https://github.com/Aloxaf/fzf-tab)
# - [proxy-utils](https://github.com/BlockLune/proxy-utils)
# - [zsh-autosugestions](https://github.com/zsh-users/zsh-autosuggestions)
# - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
# - [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)

# powerlevel10k configuration
## (Should stay close to the top of ~/.zshrc.)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
## Set powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh configuration
# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
## Remind me to update oh-my-zsh
zstyle ':omz:update' mode reminder
## Plugins
plugins=(
  fast-syntax-highlighting
  fzf
  fzf-tab
  history-substring-search 
  proxy-utils
  you-should-use
  zsh-autosuggestions 
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
source $ZSH/oh-my-zsh.sh

# Set Windows codepage to 65001 (UTF-8)
if [[ "$OSTYPE" == "msys" ]]; then
    chcp.com 65001 &> /dev/null
fi

# Safe environment
# Do not log out with <Ctrl-D>
setopt IGNORE_EOF
# Do not overwrite files via '>'
setopt NO_CLOBBER

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE 
setopt HIST_SAVE_NO_DUPS

# locale
# Support non-ASCII characters in terminal
# Note: use LC_ALL='C' if you want sort to behave in expected way
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
# env
[[ -f ~/.env ]] && source ~/.env
# utils
[[ -f ~/.utils ]] && source ~/.utils

# mise
eval "$(mise activate zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"
