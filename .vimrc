" Common
set shiftwidth=4
set tabstop=4
set expandtab
set number
set selection=exclusive
set shell=/bin/sh
set autoindent
set autoread
set showcmd
set nocompatible

" Syntax highlighting
syntax on
colorscheme molokai

" Closetag script
autocmd Filetype html let g:closetag_html_style=1
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd BufWritePost *.go :GoInstall

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
let g:go_auto_type_info = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"

" Emmet plugin
let g:user_emmet_leader_key='<C-C>'

" YouCompleteMe plugin
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" DelimitMate plugin
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Airline plugin
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

" NERDTree & NERDTree tabs plugins
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Instant markdown
let g:instant_markdown_autostart = 0

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Shortcuts remap
nmap  <F2>          :tabnew<CR>
nmap  <F3>          :tabclose<CR>
nmap  <F4>          :set hlsearch<CR>
nmap  <F5>          :nohlsearch<CR>
nmap  <F6>          :NERDTreeTabsToggle<CR>
nmap  <F7>          :GundoToggle<CR>
nmap  <F8>          :TagbarToggle<CR>
nmap  <silent><F9>  :MaximizerToggle<CR>
nmap  <F10>         :Tabularize /,\zs<CR>
vmap  <F10>         :Tabularize /,\zs<CR>
nmap  <F12>         :Tabularize / \zs<CR>
vmap  <F12>         :Tabularize / \zs<CR>
nmap  <C-Down>      :tabprevious<CR>
nmap  <C-Up>        :tabnext<CR>
