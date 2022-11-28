#!/usr/bin/env sh

#variaveis==============
url_nvim="https://github.com/davieduardo001/nvim-config-vimscript.git"
dir_nvim="$HOME/.config/nvim"

url_nano="https://github.com/davieduardo001/nanorc-config.git"
dir_nano="$HOME"
#=======================

cd "$HOME"
sudo dnf install git

#nvim===================
#INSTALANDO NVIM
sudo dnf install neovim
if [ $(type -p nvim) ]; then
    echo "**zsh ja instalado!"
    chsh -s /bin/zsh
else
    echo "**zsh nao instalado!"
    sudo dnf install neovim
    chsh -s /bin/zsh
fi

#INSTALANDO CONFIG
if [ -d "$dir_nvim" ]; then
    echo "diretorio existe!!"

    echo "excluindo diretorio"
    sleep 3s
    rm -r "$dir_nvim"

    echo "**instalando config"
    mkdir "$dir_nvim"
    git clone "$url_nvim" "$dir_nvim"
else
    echo "**diretorio nao existe"
    mkdir "$dir_nvim"
    git clone "$url_nvim" "$dir_nvim"
fi

#INSTALING VIM-PLUG
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#zsh====================
if [ $(type -p zsh) ]; then
    echo "**zsh ja instalado!"
else
    echo "**zsh nao instalado!"
    sudo dnf install zsh
fi

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

