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
autocmd VimEnter * nested :TagbarOpen
autocmd VimEnter * nested :NERDTreeFind
autocmd VimEnter * nested :NERDTreeFocusToggle

" Go-vim plugin
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

" YouCompleteMe plugin
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Airline plugin
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

" NERDTree & NERDTree tabs plugins
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" Shortcuts remap
nmap <F8> :TagbarToggle<CR>
nmap <F2> :tabnew<CR>
nmap <F3> :tabclose<CR>
nmap <C-Down> :tabprevious<CR>
nmap <C-Up> :tabnext<CR>
