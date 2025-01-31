# My zsh configuration file
# Make sure to install the following packages before using this configuration:
# - [oh-my-zsh](https://ohmyz.sh/)
# - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
# - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
# - [zsh-autosugestions](https://github.com/zsh-users/zsh-autosuggestions)
# - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
# - [zsh-osx-autoproxy](https://github.com/sukkaw/zsh-osx-autoproxy) (optional)
# Note: You may need to do some modifications to the configuration file to make it work on your system.
# References:
# - https://lift.cs.princeton.edu/java/.bashrc
# - https://github.com/JJGO/dotfiles/blob/master/zsh/.zprezto/runcoms/zshrc
# - https://blog.skk.moe/post/make-oh-my-zsh-fly/


# powerlevel10k configuration
## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
## Initialization code that may require console input (password prompts, [y/n]
## confirmations, etc.) must go above this block; everything else may go below.
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
  you-should-use
  z
  zsh-autosuggestions 
  # zsh-osx-autoproxy # optional
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
source $ZSH/oh-my-zsh.sh

# Set Windows codepage to 65001 (UTF-8) (optional)
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

# env
[[ -f ~/.env ]] && source ~/.env
# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# lazyload
nvm() {
    if [ -d "$HOME/.nvm" ]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        nvm "$@"
    else
        echo "nvm is not installed" >&2
        return 1
    fi
}

# proxy settings
proxy() {
  if [[ "$1" == "-d" || "$1" == "--disable" || "$1" == "-c" || "$1" == "--clear" ]]; then
    unset https_proxy http_proxy all_proxy
    echo "Proxy disabled"
  elif [[ "$1" == "--check" ]]; then
    if command -v wget &> /dev/null; then
      wget --spider --proxy=on http://google.com -q -T 10
      if [ $? -eq 0 ]; then
        echo "Proxy is working"
      else
        echo "Proxy is not working"
      fi
    elif command -v curl &> /dev/null; then
      curl --proxy http://127.0.0.1:7890 http://google.com -s -m 10 --connect-timeout 10
      if [ $? -eq 0 ]; then
        echo "Proxy is working"
      else
        echo "Proxy is not working"
      fi
    else
      echo "Neither wget nor curl is installed, cannot check proxy"
    fi
  else
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    echo "Proxy enabled"
  fi
}

