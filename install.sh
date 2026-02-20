#!/bin/sh

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git wget unzip build-essential xclip ripgrep fd-find zsh
sudo apt install direnv lazygit fzf yazi

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz

sudo mv eza /usr/local/bin/
rm eza_x86_64-unknown-linux-gnu.tar.gz

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl -LO https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip
unzip yazi-x86_64-unknown-linux-musl.zip
sudo mv yazi-x86_64-unknown-linux-musl/yazi /usr/local/bin/
rm -rf yazi-x86_64-unknown-linux-musl

mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting 2>/dev/null || true

sudo chsh -s $(which zsh) $USER

cp ~/dotfiles/nvim ~/.config
cp ~/dotfiles/zsh/.zshrc  ~/
cp ~/dotfiles/zsh/.zsh ~/.zsh

mkdir -p /mnt/c/Users/sist-jacosta/AppData/Roaming/alacritty
cp ~/dotfiles/alacritty/alacritty.toml /mnt/c/Users/sist-jacosta/AppData/Roaming/alacritty
