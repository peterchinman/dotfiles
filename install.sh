#!/bin/bash

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles from $DOTFILES"

# Create symlinks
link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"

  if [ -L "$dst" ]; then
    echo "  $2 already linked"
  elif [ -e "$dst" ]; then
    echo "  $2 exists, backing up to $2.backup"
    mv "$dst" "$dst.backup"
    ln -s "$src" "$dst"
    echo "  $2 linked"
  else
    ln -s "$src" "$dst"
    echo "  $2 linked"
  fi
}

echo ""
echo "Linking config files..."
link "zshrc" ".zshrc"
link "aliases" ".aliases"
link "functions" ".functions"
link "gitconfig" ".gitconfig"
link "gitattributes" ".gitattributes"

echo ""
echo "Done! Config files linked."
echo ""

# Check for missing dependencies
echo "Checking dependencies..."
missing=()

command -v fnm >/dev/null 2>&1 || missing+=("fnm")
command -v starship >/dev/null 2>&1 || missing+=("starship")
command -v atuin >/dev/null 2>&1 || missing+=("atuin")
command -v bun >/dev/null 2>&1 || missing+=("bun")
command -v fzf >/dev/null 2>&1 || missing+=("fzf")
command -v zoxide >/dev/null 2>&1 || missing+=("zoxide")
command -v nnn >/dev/null 2>&1 || missing+=("nnn")

if [ ${#missing[@]} -eq 0 ]; then
  echo "  All dependencies installed!"
else
  echo "  Missing: ${missing[*]}"
  echo ""
  echo "Install with:"
  for cmd in "${missing[@]}"; do
    case $cmd in
      fnm)      echo "  brew install fnm" ;;
      starship) echo "  brew install starship" ;;
      atuin)    echo "  brew install atuin" ;;
      bun)      echo "  curl -fsSL https://bun.sh/install | bash" ;;
      fzf)      echo "  brew install fzf" ;;
      zoxide)   echo "  brew install zoxide" ;;
      nnn)      echo "  brew install nnn" ;;
    esac
  done
fi

echo ""
echo "Restart your shell or run: source ~/.zshrc"
