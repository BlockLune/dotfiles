# dotfiles

My [dotfiles](https://dotfiles.github.io/), managed using [GNU Stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

This repository contains configurations for various tools I use daily. GNU Stow is used to symlink configuration files (dotfiles) into their appropriate locations in the home directory.

## 🚀 Quick Start

### Prerequisites

Ensure you have the following installed:

- `curl`
- `git`
- `stow`
- The app you want to configure (e.g., `zsh`, `vim`, etc.)

### Zsh Setup Example

1. Clone the repository and symlink the Zsh configuration with GNU Stow:

   ```shell
   cd ~
   git clone --depth=1 https://github.com/BlockLune/dotfiles.git
   cd dotfiles
   stow zsh
   ```

2. Set up the `.zshrc` file:

   ```shell
   echo 'source ~/.zshrc_base' > ~/.zshrc
   ```

3. (Optional) Change your default shell to Zsh:

   ```shell
   chsh -s "$(which zsh)"
   ```

4. Restart your terminal emulator or open a new Zsh session to apply changes.

### Vim Setup Example

1. Clone the dotfiles repository and symlink the Vim configuration:

   ```shell
   cd ~
   git clone --depth=1 https://github.com/BlockLune/dotfiles.git
   cd dotfiles
   stow vim
   ```

2. Install the plugin manager [`vim-plug`](https://github.com/junegunn/vim-plug):

   ```shell
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. Launch Vim and install plugins:

   ```shell
   vim +PlugInstall
   ```

   Or, manually within Vim:

   ```text
   :PlugInstall
   ```
