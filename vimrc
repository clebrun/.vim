" cooperlebrun@gmail.com

" change <leader> from / to ,
let mapleader = ","
let g:mapleader = ","

" ##############################################################################
" TODO: learn basic vimscript, rewrite pluging configuration to not break vim
" if the plugin is not installed.

" #PLUGIN CONFIGURATION#
" ----------------------
" if statements keep this config portable. Don't litter.
" Depricated in favor of vundle
" Pathogen " THIS HAS TO GO FIRST
"execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
" 3 deps for snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'Lokaltog/vim-easymotion'

" CtrlP
if has("CtrlP")
	" map <C-p> to open CtrlP
	let g:ctrlp_cmd = 'CtrlPMixed'
	let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
	let g:ctrlp_dotfiles = 0
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_match_window_bottom = 0
	let g:ctrlp_match_window_reversed = 0
	let g:ctrlp_switch_buffer = 0
	let g:ctrlp_working_path_mode = 0
endif

" NerdTree
nmap <leader>e :NERDTreeToggle<CR>

" EasyMotion
" not sure if this works
let g:EasyMotion_leader_key = '<Leader>'

"############################################################################## 
" #General Configuration#
" -----------------------

" disable backups
set nobackup

set autoread

" keep up to 50 previous searches
set history=50

set laststatus=2 " required for powerline
set nocompatible " disable vi compatibility
set noswapfile
set encoding=utf-8
set showmode

set guifont=Monospace\ 11 " try :set guifont=* for a graphical menu
"set spell " spell-check on by default
set wildmenu
syntax enable
filetype plugin indent on

" Appearance Options
colorscheme zenburn " for new color schemes, download into ~/.vim/colors
" Vertical and horizontal line highlights
set cursorcolumn
set cursorline

" Pretty unicode characters for whitespace when list is on
set listchars=tab:▸\ ,eol:¬

set rnu
set colorcolumn=80

" Case Options
set ignorecase
set smartcase

" Search Options
set incsearch " Highlights searches
set hlsearch " Highlights current search

" Scroll Options
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Indentation Options
set noexpandtab
set smartindent

" Softtabstob, Tabstop, and Shiftwidth need to be =
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Buffer Options
set hidden " make hidden buffers automagically 

" Filetype specific options
" use formating options if editing a plain text file
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t

" #KEY MAPPINGS#
" --------------

" Alternate esc mapping
inoremap <leader>. <esc>

"" Go to last buffer with <C-e>
nmap <C-e> :b#<CR>

nmap <leader><leader> :w<CR>
nmap <leader><space> :nohlsearch<CR> 
nmap <leader>V :source $MYVIMRC<CR>
nmap <leader>gc :e ~/Code/<CR> 
nmap <leader>k :bd<CR>

" Make a separator out of -s that is equal in length to the current line
nmap <leader>l yypVr-
nmap <leader>n :bn<CR>

" Open this file
nmap <leader>ov :e ~/.vim/vimrc<CR> 

" Open snippets folder
nmap <leader>os :e ~/.vim/bundle/vim-snippets/snippets<CR> 

nmap <leader>oz :e ~/.zshrc<CR> 
nmap <leader>p :CtrlPMixed<CR>
nmap <leader>q :q<CR>

" Toggle spell-check
nmap <leader>ss :set spell!<CR> 

" Switch between number and rnu more easily
nmap <leader>sn :set number<CR> 
nmap <leader>sr :set rnu<CR> 

" Easy filetype setting
nmap <leader>sf :set ft=

" Copy and Paste
nmap <leader>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vmap <leader>c y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

vnoremap <leader>a :Align\|<cr>

" Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" j and k navigate absolutely as opposed to navigating linewise
nmap j gj
nmap k gk

" tab goes to next occurrence of the word your cursor is on
map <tab> *

" Next or previous occurrence of SEARCH is centered when jumped to
nnoremap n nzzzv
nnoremap N Nzzzv

" H and L now do 0 and $
nnoremap H ^
nnoremap L g_

" J&K in the style of H and L

" Don't move when * is invoked, just search
nnoremap * *<c-o>


" make Y behave like other capitals
nnoremap Y y$

" <F2> takes a name of a program and generates a hashbang (e.g.
" #!/usr/bin/bash)
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
