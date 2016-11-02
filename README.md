# go-vim-install

[![Build Status](https://travis-ci.org/xlucas/go-vim-install.svg?branch=master)](https://travis-ci.org/xlucas/go-vim-install)

Easy environment setup for Vim addicts and go developers on Ubuntu.

## Install

Hereinafter are two easy ways to get your vim environment ready for go development.

###### Standard

```
wget https://raw.githubusercontent.com/xlucas/go-vim-install/master/install.sh
chmod +x install.sh
```

###### Vagrant
If you want to boot up a clean Ubuntu VM with a GUI and all the features ready to be used, you can use [this gist](https://gist.github.com/xlucas/a7e9e56db314aafada2f).

## Usage

While there are a lot of great plugins of all kinds for Vim made by amazing people, that's always a hassle to retrieve them all, configure your `.vimrc`, install colorschemes and extra stuff to get everything eventually working. This little installer for ubuntu make the life simpler for go development with Vim, by providing a command line with 3 options to either :
- Download and install go from a remote tarball containing the go version of your choice (option `-go`).
- Setup a fully working Vim environment with amazing plugins, third party helpers and colorschemes (option `-vim`).
- Setup your go workspace with required go tools for Vim plugins (option `-work`).

Examples :

- `./install.sh -go https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz`
- `./install.sh -vim`
- `./install.sh -work ~/Workspace/go`

Be aware to run `. ~/.profile` after a step is done so environment variables are up to date.

That's all !

## Vim environment

The script will install [pathogen](https://github.com/tpope/vim-pathogen) and the following plugins :

- [vim-go](https://github.com/fatih/vim-go)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [tagbar](https://github.com/majutsushi/tagbar)
- [fugitive](https://github.com/tpope/vim-fugitive)
- [vim-airline](https://github.com/bling/vim-airline)
- [powerline](https://github.com/powerline/powerline)
- [NERDTree](https://github.com/scrooloose/nerdtree)
- [vim-NERDTree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
- [syntastic](https://github.com/scrooloose/syntastic)
- [better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
- [gundo.vim](https://github.com/sjl/gundo.vim)
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [tabular](https://github.com/godlygeek/tabular)
- [ultisnips](https://github.com/sirver/ultisnips)
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
- [ctrlp](https://github.com/kien/ctrlp.vim)
- [ag.vim](https://github.com/rking/ag.vim.git)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter.git)
- [vim-qargs](https://github.com/nelstrom/vim-qargs)
- [vim-easygrep](https://github.com/dkprice/vim-easygrep)
- [vim-grammarous](https://github.com/rhysd/vim-grammarous)
- [vim-easy-align](https://github.com/junegunn/vim-easy-align)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

The colorscheme bundled is a variant of [molokai](https://github.com/fatih/molokai).

Here's a screenshot of what the environment will look like :

![go-vim-install](https://raw.githubusercontent.com/xlucas/go-vim-install/master/doc/screenshot.png)

The script will install the Monaco font. Set it with a size between 11 and 12 in your terminal configuration.

## Workspace setup

The script will install these packages in your workspace :
- [gocov](https://github.com/axw/gocov)
- [gotags](https://github.com/jstemmer/gotags)
- [gocode](https://github.com/nsf/gocode)
- [godef](https://github.com/rogpeppe/godef)
- [goimports](https://golang.org/x/tools/cmd/goimports)
- [guru](https://golang.org/x/tools/cmd/guru)
- [gorename](https://golang.org/x/tools/cmd/gorename)
- [golint](https://github.com/golang/lint)
- [errcheck](https://github.com/kisielk/errcheck)

Most of them are required to have the go-vim plugin fully working. Then you can run crazy things from Vim, like test units with (`:GoTest`), coverage report with (`:GoCoverage`), refactor an element name and its references (`:GoRename`), do code inspection and error checking (`:GoDoc`, `:GoInfo`, `:GoCallers`, `:GoCallees`, `:GoErrCheck` ...), build your packages (`:GoBuild`), detect unchecked errors (`:GoErrCheck`) and much more. Obviously, you can also remap all these actions to shortcuts of your choice in your `.vimrc` ! Check the go-vim plugin documentation to get [a full list](https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) of Go-specific features.

If you don't know what other plugins are doing, you will find some other tasty functionnalities in related documentations !

## Shortcuts

The following default shortcuts are set in the `.vimrc` file :

### General
- <kbd>F2</kbd> : Create a new tab
- <kbd>F3</kbd> : Maximize/restore current window
- <kbd>F4</kbd> : Enable search highlight
- <kbd>F5</kbd> : Disable search highlight
- <kbd>F6</kbd> : Show/hide the file tree
- <kbd>F7</kbd> : Show/hide the undo tree
- <kbd>F8</kbd> : Show/hide the tagbar (shown by default)
- <kbd>F9</kbd> : Close the current tab
- <kbd>CTRL</kbd> + <kbd>Up</kbd> : Go to the next tab
- <kbd>CTRL</kbd> + <kbd>Down</kbd> : Go to the previous tab

### Formatting
- <kbd>F10</kbd> : Align text using ',' as a delimiter
- <kbd>F12</kbd> : Align text using space as a delimiter
- <kbd>CTRL</kbd> + <kbd>C</kbd> + <kbd>,</kbd> : Format Zen Coding
- <kbd>CTRL</kbd> + <kbd>\_</kbd> : Autoclose xml/html tag(s) (repeat to close several ones)
- <kbd>CTRL</kbd> + <kbd>j</kbd> : Expand snippet
- <kbd>CTRL</kbd> + <kbd>n</kbd> : Go to next snippet item
- <kbd>CTRL</kbd> + <kbd>p</kbd> : Go to previous snippet item

### Search and replace
- <kbd>CTRL</kbd> + <kbd>p</kbd> : Search for a file
- leader + <kbd>a</kbd> : Search for a word recursively from project's root directory
- leader + <kbd>aa</kbd> : Search word under cursor recursively from project's root directory
- leader + leader + <kbd>s</kbd> : Replace all occurences of word under the cursor in this file
- leader + <kbd>vr</kbd> : Recursively replace occurences of word under the cursor in all files

### Grammar
- leader + <kbd>g</kbd> : Run a grammar check
- <kbd>!</kbd> : Go to next grammar error
- <kbd>§</kbd> : Go to previous grammar error
- leader + <kbd>ga</kbd> : Fix all grammar errors automatically
- leader + <kbd>gf</kbd> : Fix this grammar error
- leader + <kbd>gr</kbd> : Remove this grammar error
- leader + <kbd>gd</kbd> : Disable this grammar rule

### Git
- <kbd>]c</kbd> : Go to next hunk
- <kbd>[c</kbd> : Go to previous hunk
- leader + <kbd>hp</kbd> : Preview current git hunk
- leader + <kbd>hr</kbd> : Revert current git hunk
- leader + <kbd>hs</kbd> : Stage current git hunk

### Go code
- <kbd>,</kbd> : Jump to next warning/error
- <kbd>?</kbd> : Jump to previous warning/error
- leader + <kbd>b</kbd> : Go build
- leader + <kbd>c</kbd> : Go coverage
- leader + <kbd>l</kbd> : Go lint
- leader + <kbd>i</kbd> : Show type info of word under cursor
- leader + <kbd>e</kbd> : Rename word under cursor
- leader + <kbd>f</kbd> : Implement an interface
- leader + <kbd>ff</kbd> : Show interface implementing the type under the cursor
- leader + <kbd>p</kbd> : Share selection in the go playground
- leader + <kbd>q</kbd> : Import package (type package name)
- leader + <kbd>r</kbd> : Go run (normal mode) / Add tags to a selected struct (visual mode)
- leader + <kbd>s</kbd> : Go install
- leader + <kbd>t</kbd> : Go test
- leader + <kbd>v</kbd> : Go vet
- leader + <kbd>ds</kbd> : Open declaration of word under cursor in new split window
- leader + <kbd>dv</kbd> : Open declaration of word under cursor in new vertical window
- leader + <kbd>dt</kbd> : Open declaration of word under cursor in new tab
- leader + <kbd>gs</kbd> : Open godoc of word under cursor in new split window
- leader + <kbd>gv</kbd> : Open godoc of word under cursor in new vertical window
- leader + <kbd>gb</kbd> : Open godoc of word under cursor in browser
