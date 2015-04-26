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
    sudo apt-get install -y git vim build-essential cmake python-dev python-pip python-setuptools ctags xdg-utils npm
    mkdir -p ~/.vim/{autoload,bundle,colors,scripts}

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
    git clone "https://github.com/mattn/emmet-vim.git"
    git clone "https://github.com/Raimondi/delimitMate.git"
    git clone "https://github.com/szw/vim-maximizer.git"
    git clone "https://github.com/godlygeek/tabular.git"
    git clone "https://github.com/SirVer/ultisnips.git"
    git clone "https://github.com/suan/vim-instant-markdown.git"

    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    bash install.sh

    # Colorscheme
    cd ~/.vim/colors
    curl -sLO "https://raw.githubusercontent.com/xlucas/go-vim-install/master/molokai.vim"

    cd $cwd

    # Closetag script
    curl -sL "http://vim.sourceforge.net/scripts/download_script.php?src_id=4318" -o ~/.vim/scripts/closetag.vim

    # Powerline
    pip install --user powerline-status

    mkdir -p ~/.fonts/
    mkdir -p ~/.config/fontconfig/conf.d/

    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"

    fc-cache -vf ~/.fonts

    # Monaco font
    wget -L -O - https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash

    echo "export PATH=\$PATH:$(readlink -f ~/.local/bin)" >> ~/.profile

    # Snippets
    curl -sL -o ~/.vim/bundle/vim-go/gosnippets/UltiSnips/go.snippets "https://raw.githubusercontent.com/xlucas/go-vim-install/master/go.snippets"

    # Instant markdown
    sudo npm -g install instant-markdown-d

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
