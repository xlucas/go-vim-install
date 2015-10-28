#!/bin/bash

install_go() {
    curl -s "$1" | sudo tar -C /usr/local -xzvf -
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
    exit 0
}

install_vim() {
    dependencies=(
        git
        vim
        build-essential
        cmake
        python-dev
        python-pip
        python-setuptools
        ctags
        xdg-utils
        npm
    )

    repositories=(
        majutsushi/tagbar
        fatih/vim-go
        Valloric/YouCompleteMe
        bling/vim-airline
        tpope/vim-fugitive
        scrooloose/nerdtree
        jistr/vim-nerdtree-tabs
        scrooloose/syntastic
        ntpeters/vim-better-whitespace
        sjl/gundo.vim
        mattn/emmet-vim
        Raimondi/delimitMate
        szw/vim-maximizer
        godlygeek/tabular
        SirVer/ultisnips
        suan/vim-instant-markdown
    )

    # Backup
    cp -f ~/.vimrc ~/.vimrc.old.$(date +%s)

    # Install packages
    sudo apt-get install -y ${dependencies[@]}

    # Plugin manager bootstrap
    mkdir -p ~/.vim/{autoload,bundle,colors,scripts}
    wget -P ~/.vim/autoload "https://tpo.pe/pathogen.vim"
    wget -P ~/.vim/colors "https://raw.githubusercontent.com/xlucas/go-vim-install/master/molokai.vim"

    # Clone necessary stuff
    for repository in ${repositories[@]} ; do
        git clone "https://github.com/${repository}.git" ~/.vim/bundle/${repository#[^/]*/}
    done

    # Closetag script and snippets
    curl -sL -o ~/.vim/scripts/closetag.vim "http://vim.sourceforge.net/scripts/download_script.php?src_id=4318"
    wget -P ~/.vim/bundle/vim-go/gosnippets/UltiSnips "https://raw.githubusercontent.com/xlucas/go-vim-install/master/go.snippets"

    # YCM compilation
    cd ~/.vim/bundle/YouCompleteMe && {
        git submodule update --init --recursive
        bash install.sh
    } && cd -

    # Powerline
    pip install --user powerline-status

    # Fonts
    mkdir -p ~/.{fonts,config/fontconfig/conf.d}
    wget -L -O - "https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh" | bash
    wget -P ~/.fonts "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    wget -P ~/.config/fontconfig/conf.d "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
    fc-cache -vf ~/.fonts

    # Instant markdown
    sudo npm -g install instant-markdown-d

    # Vimrc
    wget -P ~ "https://raw.githubusercontent.com/xlucas/go-vim-install/master/.vimrc"

    # Path
    echo "export PATH=\$PATH:$(readlink -f ~/.local/bin)" >> ~/.profile
    exit 0
}


install_ws() {
    dependencies=(
        github.com/axw/gocov/gocov
        github.com/jstemmer/gotags
        github.com/nsf/gocode
        github.com/rogpeppe/godef
        golang.org/x/tools/cmd/goimports
        golang.org/x/tools/cmd/oracle
        golang.org/x/tools/cmd/gorename
        github.com/golang/lint/golint
        golang.org/x/tools/cmd/godoc
        github.com/kisielk/errcheck
    )

    # Prepare workspace path
    mkdir -p $1
    echo "export GOPATH=$1"             >> ~/.profile
    echo "export PATH=\$PATH:$1/bin"    >> ~/.profile
    . ~/.profile

    # Download dependencies
    cd ${GOPATH}
    for dependency in ${dependencies[@]} ; do
        go get ${dependency}
    done

    cd -
    exit 0
}

# Main
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
