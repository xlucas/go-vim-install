# go-vim-install
Easy environment setup for Vim addicts and go developers.

## Usage

This little installer for ubuntu make the life simpler for go development with Vim.
The idea here is to provide 3 commands to either :
- Download and install go from a tarball and set environment variables.
- Setup a fully working Vim environment with amazing plugins.
- Setup your go workspace with a few useful packages.

Examples :

- `./install.sh -go https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz`
- `./install.sh -vim`
- `./install.sh -work ~/Workspace/go`

You will need to force `. ~/.bash_profile` to reload environment variables after this.

## Vim environment

The script will install pathogen and the following plugins :

- [vim-go](https://github.com/fatih/vim-go)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [tagbar](https://github.com/majutsushi/tagbar)
- [fugitive](https://github.com/tpope/vim-fugitive)
- [vim-airline](https://github.com/bling/vim-airline)
- [powerline](https://github.com/powerline/powerline)
- [NERDTree](https://github.com/scrooloose/nerdtree)
- [NERDTree-tabs](https://github.com/jistr/vim-nerdtree-tabs)

The colorscheme bundled is a variant of [molokai](https://github.com/fatih/molokai).

![go-vim-install](https://raw.githubusercontent.com/xlucas/go-vim-install/master/screenshot.png)

## Workspace setup

The script will install in your workspace :
- [gocov](https://github.com/axw/gocov/gocov)
- [gotags](https://github.com/jstemmer/gotags)
- [gocode](https://github.com/nsf/gocode)
- [godef](https://github.com/rogpeppe/godef)
- [goimports](https://golang.org/x/tools/cmd/goimports)
- [oracle](https://golang.org/x/tools/cmd/oracle)
- [gorename](https://golang.org/x/tools/cmd/gorename)
- [golint](https://github.com/golang/lint/golint)
- [errcheck](https://github.com/kisielk/errcheck)

## Shortcuts

The following shortcuts are included in the `.vimrc` file :

- <kbd>F8</kbd> : Show/hide the tagbar (shown by default)
- <kbd>F2</kbd> : Create a new tab
- <kbd>F3</kbd> : Close the current tab
- <kbd>CTRL</kbd> + <kbd>Up</kbd> : Go to the next tab
- <kbd>CTRL</kbd> + <kbd>Down</kbd> : Go to the previous tab

