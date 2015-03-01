" Common
set shiftwidth=4
set tabstop=4
set expandtab
set number
set selection=exclusive
set shell=sh

" Syntax highlighting
syntax on
colorscheme monokai
colorscheme molokai

" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Tagbar plugin 
nmap <F8> :TagbarToggle<CR>
autocmd VimEnter * nested :TagbarOpen

" Airline plugin
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts=1
