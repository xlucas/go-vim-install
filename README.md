# go-vim-install
Easy environment setup for Vim addicts and go developers.

## Usage

While there are a lot of great plugins of all kinds for Vim made by amazing people, that's alway a hassle to gather them all, install colorschemes and extra stuff to get everything eventually working. This little installer for ubuntu make the life simpler for go development with Vim, by providing a command line with 3 options to either :
- Download and install go from a tarball and set your environment variables with option `-go`.
- Setup a fully working Vim environment with amazing plugins, third party helpers and colorschemes with option `-vim`.
- Setup your go workspace with a few useful packages with option `-work`.

Examples :

- `./install.sh -go https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz`
- `./install.sh -vim`
- `./install.sh -work ~/Workspace/go`

Then `. ~/.bash_profile` and you are done !

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

These two colorschemes will be available :

- [molokai](https://github.com/fatih/molokai)
- [monokai](https://github.com/sickill/vim-monokai)

Here's a screenshot of what the environement will look like :

![go-vim-install](https://raw.githubusercontent.com/xlucas/go-vim-install/master/screenshot.png)

## Workspace setup

The script will install these packages in your workspace :
- [gocov](https://github.com/axw/gocov)
- [gotags](https://github.com/jstemmer/gotags)
- [gocode](https://github.com/nsf/gocode)
- [godef](https://github.com/rogpeppe/godef)
- [goimports](https://golang.org/x/tools/cmd/goimports)
- [oracle](https://golang.org/x/tools/cmd/oracle)
- [gorename](https://golang.org/x/tools/cmd/gorename)
- [golint](https://github.com/golang/lint)
- [errcheck](https://github.com/kisielk/errcheck)

Most of them are required to get Vim plugins fully working. Then you can run crazy things from Vim, like test units with (`:GoTest`), coverage report with (`:GoCoverage`), refactor an element name and its reference (`:GoRename`, do code inspection and error checking (`:GoCallers`, `:GoCallees`, `:GoErrCheck` ...), build your packages and much more. Obviously, you can also remap all these actions to shortcuts of your choice ! Check the go-vim plugin documentation to get [a full list](https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) of available features.

## Shortcuts

The following default shortcuts are set in the `.vimrc` file :

- <kbd>F8</kbd> : Show/hide the tagbar (shown by default)
- <kbd>F2</kbd> : Create a new tab
- <kbd>F3</kbd> : Close the current tab
- <kbd>CTRL</kbd> + <kbd>Up</kbd> : Go to the next tab
- <kbd>CTRL</kbd> + <kbd>Down</kbd> : Go to the previous tab

