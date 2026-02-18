#!/bin/sh

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

echo -e "${BLUE}--- Iniciando instalación del entorno ---${NC}"

echo -e "${GREEN}[1/7] Actualizando sistema e instalando dependencias...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git wget unzip build-essential xclip ripgrep fd-find zsh

echo -e "${GREEN}[2/7] Instalando Neovim estable...${NC}"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

echo -e "${GREEN}[3/7] Instalando eza vía binario...${NC}"
wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz

sudo mv eza /usr/local/bin/
rm eza_x86_64-unknown-linux-gnu.tar.gz

echo -e "${GREEN}[4/7] Instalando Starship...${NC}"
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo -e "${GREEN}[5/7] Configurando Zsh y plugins manuales...${NC}"
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting 2>/dev/null || true

sudo chsh -s $(which zsh) $USER

echo -e "${GREEN}[6/7] Creando directorios de configuración...${NC}"

cp ~/dotfiles/nvim ~/.config
cp ~/dotfiles/zsh/.zshrc  ~/
cp ~/dotfiles/zsh/.zsh ~/.zsh

echo -e "${BLUE}--- ¡Instalación completada! Reinicia Alacritty ---${NC}"
