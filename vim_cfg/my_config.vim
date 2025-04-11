" == Base Configuration  

set encoding=utf8
" Default language on VIM start - Engish
set iminsert=0
" Disable vi compatible
set nocompatible

" Set 256 color mode
set t_Co=256

" Use system clipboard
set clipboard=unnamedplus
" Set default bash terminal
set shell=/bin/bash
" Enable confirm to close unsaved buffer
set confirm

" Enable type file detection
filetype on
" Plugins influence of plugins to file
filetype plugin on
                                                                
" Enable auto-indent like in file
filetype indent on
set autoindent

" Enable mouse scroll
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Turn syntax highlighting 
syntax on

" Turn line number
set number
" Enable snippets Emu
" Set binding on Ctrl + Space
let g:snippetsEmu_key = "<c-space>"

" Configuring tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set listchars=tab:\|\ 
set list

" Disable backup file
set nobackup

" Configuring search
set ignorecase
set smartcase
set hlsearch
set showmatch
set showmode

" Command history
set history=512

" Set wildmenu config
set wildmenu
" set wildmenu=list:longest
" set wildignore=*.docx,*.jpg You can configure exceptions for wildmenu

" == Plugins
call plug#begin()

	" List your plugins here
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'preservim/nerdtree'

call plug#end()

" ======= Theming ======= 
colorscheme catppuccin-mocha
set guifont=JetBrains\ Mono\ Medium\ 15

" Set cursor 'crosshair'
set cursorline
set cursorcolumn
set hidden

" Set cursor line theme
hi CursorLine cterm=bold ctermbg=black guibg=midnightblue gui=bold
hi CursorColumn cterm=bold ctermbg=black guibg=midnightblue gui=bold
hi CursorLineNr cterm=bold ctermbg=black guifg=orange guibg=black gui=bold

" Block cursor configuring
set ttimeoutlen=10 " Lower delay for escape keybinds
let &t_SI = "\<Esc>[2 q" " CursorBlock for INSERT MODE
let &t_SR = "\<Esc>[4 q" " CursorUnderline for REPLACE MODE
let &t_EI = "\<Esc>[2 q"
" configuring block cursor for simillar modes
set guicursor+=a:blinkon0
set guicursor+=sm:block-Cursor
hi Cursor guifg=black guibg=white ctermbg=white ctermfg=black
hi iCursor guifg=white guibg=royalblue3 ctermbg=DarkBlue ctermfg=black

" ==== Airline configuration ====
" reset all airline extensions
let g:airline_extensions = []
" tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_tabs=0
" theme
let g:airline_theme='base16'
let g:airline_tabline_mode = 'left'

" POWERLINE
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:Powerline_symbols='unicode' 
" Powerline separators
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Startup options
autocmd VimEnter * NERDTree ~/Documents 
