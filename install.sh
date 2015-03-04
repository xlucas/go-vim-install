#!/bin/bash

install_go() {

    wget -q -O - /tmp/golang.tar.gz "$1" | sudo tar -C /usr/local -xzvf -

    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile

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
    git clone "https://github.com/scrooloose/nerdtree.git"
    git clone "https://github.com/jistr/vim-nerdtree-tabs.git"
    git clone "https://github.com/scrooloose/syntastic.git"
    git clone "https://github.com/ntpeters/vim-better-whitespace.git"
    git clone "https://github.com/sjl/gundo.vim.git"

    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    bash install.sh

    # Colorscheme
    cd ~/.vim/colors
    curl -sLO "https://raw.githubusercontent.com/xlucas/go-vim-install/master/molokai.vim"

    cd $cwd

    # Powerline
    pip install --user powerline-status

    mkdir -p ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/

    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"

    fc-cache -vf ~/.fonts

    echo "export PATH=\$PATH:$(readlink -f ~/.local/bin)" >> ~/.profile

    # Vimrc
    curl -sL -o ~/.vimrc "https://raw.githubusercontent.com/xlucas/go-vim-install/master/.vimrc"

    exit 0
}


install_ws() {

    cwd=$(pwd)

    mkdir -p $1

    echo "export GOPATH=$1"             >> ~/.profile
    echo "export PATH=\$PATH:$1/bin"    >> ~/.profile

    . ~/.profile

    cd $GOPATH

    go get github.com/axw/gocov/gocov
    go get github.com/jstemmer/gotags
    go get github.com/nsf/gocode
    go get github.com/rogpeppe/godef
    go get golang.org/x/tools/cmd/goimports
    go get golang.org/x/tools/cmd/oracle
    go get golang.org/x/tools/cmd/gorename
    go get github.com/golang/lint/golint
    go get github.com/kisielk/errcheck

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
