" change <leader> from \ to ,
let mapleader = ","
let g:mapleader = ","

" ##############################################################################
" TODO: learn basic vimscript, rewrite pluging configuration to not break vim
" if the plugin is not installed.

" #PLUGIN CONFIGURATION#
" ----------------------
" if statements keep this config portable. Don't litter.

" Depricated in favor of Vundle
" Pathogen 
"execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/powerline'
" old, replace at some point
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
" 3 dependencies for snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'

" CtrlP
if has("CtrlP")
	let g:ctrlp_cmd = 'CtrlPMixed'
	let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
	let g:ctrlp_dotfiles = 0
	let g:ctrlp_map = '<leader>p'
	let g:ctrlp_match_window_bottom = 0
	let g:ctrlp_match_window_reversed = 0
	let g:ctrlp_switch_buffer = 0
	let g:ctrlp_working_path_mode = 0
endif

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>

" EasyMotion
" let g:EasyMotion_leader_key = '<Leader>'

"############################################################################## 

" #Settings#
" ----------

syntax enable
filetype plugin indent on

set nobackup " disable backups
set autoread
set lazyredraw " Performance tweak, don't redraw while executing macros
set history=500 " keep up to 50 previous commands
set laststatus=2 " required for powerline
set nocompatible " disable vi compatibility
set noswapfile
set encoding=utf-8 " show utf-8 chars properly
" set showmode " Not needed when powerline is on
set guifont=Monospace\ 11 " try :set guifont=* for a graphical menu
"set spell " spell-check on by default
set wildmenu " show auto-completion menu
colorscheme zenburn " for new color schemes, download into ~/.vim/colors
set cursorcolumn " Vertical and...
set cursorline " horizontal line highlights
set listchars=tab:▸\ ,eol:¬ " Pretty unicode characters for whitespace when list is on
set rnu " show line numbers
set colorcolumn=80 " highlight columb 80

" Search Options
set ignorecase " Searches are case insensitive
set smartcase " unless they contain an uppercase character
set incsearch " Jumps to search as you search
set hlsearch " Highlights current search

" Scroll Options
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Indentation Options
set expandtab " don't use tab characters
set smartindent
" Softtabstob, Tabstop, and Shiftwidth need to be =
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Buffer Options
set hidden " make hidden buffers automagically 

" Filetype specific options
" use formating options if editing a plain text file
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t

"############################################################################## 

" #KEY MAPPINGS#
" --------------

" Alternate esc mapping
map ,. <esc>
inoremap ,. <esc>
" or for qwerty
" inoremap kj <esc>

" auto complete
inoremap <leader><tab> <c-p>

" quick split switch
inoremap <leader><tab> <c-p>

" Go to last buffer with <C-e>
nmap <C-e> :b#<CR>

"" Operations
" save
nmap <leader>w :w<CR> 
nmap <leader>W :w!<CR> 
" quit
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>
" Delete current buffer
nmap <leader>d :bd<CR>
nmap <leader>D :bd!<CR>
" Next and previous buffer
nmap <leader>k :bn<CR>
nmap <leader>j :bp<CR>
" Re-source
nmap <leader>v :source $MYVIMRC<CR>

" Make a separator out of -s that is equal in length to the current line
map <leader>l yypVr-

" CtrlP
nmap <leader>p :CtrlPMixed<CR>

"" Edits
" vimrc
nmap <leader>ov :e ~/.vim/vimrc<CR> 
" snippets folder
nmap <leader>os :e ~/.vim/bundle/vim-snippets/snippets<CR> 
" zshrc
nmap <leader>oz :e ~/.zshrc<CR> 

"" Settings
" Turn off search highlight
nmap <leader><space> :nohlsearch<CR>
" Filetype setting
nmap <leader>sf :set ft=

" Toggles
" Spell-check
nmap <leader>ts :set spell!<CR> 

" Copy and Paste
nmap <leader>V :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vmap <leader>c y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" j and k navigate absolutely as opposed to navigating linewise
nmap j gj
nmap k gk

" Next or previous occurrence of SEARCH is centered when jumped to
nnoremap n nzzzv
nnoremap N Nzzzv

" H and L now do 0 and $
nnoremap H ^
nnoremap L g_

" Don't move when * is invoked, just search
nnoremap * *<c-o>

" make Y behave like other capitals
nnoremap Y y$

" Takes a name of a program and generates a hashbang (e.g. #!/usr/bin/bash)
map <F2> 0v$hy0D:r! which <C-R>0<CR>I#!<esc>kJ

" Destroy Mappings
" disable arrow keys so you rely on hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"############################################################################## 
