#!/usr/bin/env bash
set -e

PLUGIN_DIR="$HOME/.local/share/herdr/vim-herdr-navigation"

if ! command -v herdr >/dev/null 2>&1; then
  curl -fsSL https://herdr.dev/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

mkdir -p "$(dirname "$PLUGIN_DIR")"

if [ ! -d "$PLUGIN_DIR" ] || [ -z "$(ls -A "$PLUGIN_DIR" 2>/dev/null)" ]; then
  rm -rf "$PLUGIN_DIR"
  git clone \
    https://github.com/paulbkim-dev/vim-herdr-navigation.git \
    "$PLUGIN_DIR"
fi

herdr plugin link "$PLUGIN_DIR"
herdr plugin action list --plugin vim-herdr-navigation
