syntax enable
filetype plugin indent on

" #GENERAL CONFIGURATION#
" -----------------------
 
set nocompatible " disable vi compatibility
set history=1000
set autoread
set noswapfile
set clipboard+=unnamed " Yanks go on clipboard instead
set showmode
set wildmenu
set spell

" Appearance Options
colorscheme zenburn " for new colorschemes, download into ~/.vim/colors
" set background=dark "" turned off to maintain zenburn defaults
set listchars=tab:▸\ ,eol:¬ " set tab chars to ▸ and end of line chars to ¬

set relativenumber " initialize rnu so that when you start you don't have an empty side
" set number when in insert mode, set relativenumber when you leave insert
" mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Case Options
set ignorecase
set smartcase

" Search Options
set incsearch " Highlights searches
set hlsearch " Highlights current search

" Scroll Options
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indentation Options
set noexpandtab
set smartindent

" Softtabstob, Tabstop, and Shiftwidth need to be =
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Buffer Options
set hidden " make hidden buffers automagically 

" ################################################################################

" #KEY MAPPINGS#
" --------------

" Window Navigation
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" Buffer Navigation
nmap <C-e> :b#<CR> " Switch to last buffer with Ctrl-e

" Leader Commands
" ---------------
"" Open Commands
nmap \ov :e ~/.vim/.vimrc<CR> " open your vimrc in a new buffer
nmap \oc :e ~/.vim/cheatsheet.txt<CR> " open your cheatsheet in a new buffer
nmap \ow :e ~/Docs/work_notes.txt<CR> " open work_notes in a new buffer
nmap \os :e ~/Docs/scratch.txt<CR> " Open scratch pad
"" Goto Commands
nmap \gc :e ~/Code/<CR> " Opens code directory
"" Settings Changes
nmap \sr :set rnu<CR> " set relative number
nmap \sn :set number<CR> " set standard number
nmap \qh :nohlsearch<CR> " Turn off search highlights
nmap \qs :set nospell<CR> " turn off spellchecker and spell highlighting
" ---------------

" j and k navigate absolutely as opposed to navigating linewise
nmap j gj
nmap k gk

" unmap keys 
" disable arrow keys so you rely on hjkl
"" for command mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"" and insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" ################################################################################

" ################################################################################

" #PLUGIN CONFIGURATION#
" ----------------------

" Pathogen
execute pathogen#infect()

" ################################################################################
