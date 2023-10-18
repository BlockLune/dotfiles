if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source  # thefuck required
zoxide init fish | source  # zoxide required

alias hx='helix' # helix required, only on archlinux
alias cd='z'  # zoxide required
alias ll='lsd -l'  # lsd required
