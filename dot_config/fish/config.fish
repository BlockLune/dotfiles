if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source  # thefuck required
zoxide init fish | source  # zoxide required

# Function: SetupAliases
# Description: Sets up aliases based on the operating system defined in /etc/os-release.
function setup_aliases
    # Sets up aliases which work on every system
    alias ll='lsd -l'  # lsd required

    # Read the /etc/os-release file
    set -gx os_release (cat /etc/os-release)

    # Parse the contents of the os_release variable
    set -l ID (string match 'ID=*' $os_release)
    set -l VERSION_ID (string match 'VERSION_ID=*' $os_release)

    # Extract the values from the matches
    set -l ID (string replace 'ID=' '' $ID)
    set -l VERSION_ID (string replace 'VERSION_ID=' '' $VERSION_ID)

    # Check the operating system
    if test "$ID" = "arch" -o "$ID" = "archarm"
        # Arch Linux or Arch ARM
        alias hx 'helix'
    else if test "$ID" = "ubuntu"
        # Ubuntu
        alias bat 'batcat'
    end
end

# Call the function to setup the aliases
setup_aliases
