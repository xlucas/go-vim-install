#!/bin/bash

install_go() {

    wget -q -O - /tmp/golang.tar.gz "$1" | sudo tar -C /usr/local -xzvf -

    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bash_profile

    exit 0
}


install_vim() {

    cwd=$(pwd)

    mv ~/.vimrc ~/.vimrc.old

    # Basic requirements
    sudo apt-get install -y git vim build-essential cmake python-dev python-pip python-setuptools ctags
    mkdir -p ~/.vim/{autoload,bundle,colors}
    
    # Pathogen
    cd ~/.vim/autoload
    curl -sLO "https://tpo.pe/pathogen.vim"

    # Plugins
    cd ~/.vim/bundle
    git clone "https://github.com/majutsushi/tagbar.git"
    git clone "https://github.com/fatih/vim-go.git"
    git clone "https://github.com/Valloric/YouCompleteMe.git"
    git clone "https://github.com/bling/vim-airline.git"
    git clone "https://github.com/tpope/vim-fugitive.git"
    
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    bash install.sh
    
    # Colorschemes
    cd ~/.vim/colors
    curl -sLO "https://raw.githubusercontent.com/fatih/molokai/master/colors/molokai.vim"
    curl -sLO "https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim"

    cd $cwd

<<<<<<< HEAD
    # Powerline
    pip install --user powerline-status

    mkdir -p ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/

    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"

    fc-cache -vf ~/.fonts

    echo "export PATH=$PATH:/$(readlink -f ~/.local/bin)" >> .bash_profile

    # Vimrc
    curl -sL -o ~/.vimrc "https://raw.githubusercontent.com/xlucas/go-vim-install/master/.vimrc"
        
=======
    curl -sL -o ~/.vimrc "https://raw.githubusercontent.com/xlucas/go-vim-install/master/.vimrc"
    
>>>>>>> e65a23741fb29c079b60565c5c71e6c67b5621c3
    exit 0
}


install_ws() {

    cwd=$(pwd)

    mkdir -p $1

    echo "export GOPATH=$1"             >> ~/.bash_profile
    echo "export PATH=\$PATH:$1/bin"    >> ~/.bash_profile
   
    . ~/.bash_profile

    cd $GOPATH

    go get github.com/axw/gocov/gocov
    go get github.com/jstemmer/gotags

    cd $cwd 

    exit 0
}



case $1 in
"-go")    install_go  $2;;
"-vim")   install_vim $2;;
"-work")  install_ws  $2;;
esac

echo "Usage : $0 OPTION"
echo "      OPTION {  "
echo "          -go TARBALL_URL : go installation"
echo "          -vim            : vim installation"
echo "          -work PATH      : workspace setup"
echo "      }"
exit 1
