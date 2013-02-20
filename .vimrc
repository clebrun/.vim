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
set background=dark
set ruler " Ruler on
set number " put line numbers on the side
set listchars=tab:▸\ ,eol:¬ " set tab chars to ▸ and end of line chars to ¬

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

" Window Navigation
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" Buffer Navigation
nmap <C-e> :b#<CR> " Switch to last buffer with Ctrl-e

" Leader Commands
nmap \q :nohlsearch<CR> " Turn off search highlights with \q
nmap \ov :e ~/.vim/.vimrc<CR> " open your vimrc in a new buffer
nmap \oc :e ~/.vim/cheatsheet.txt<CR> " open your cheatsheet in a new buffer

" j and k don't navigate absolutely as opposed to linewise
nmap j gj
nmap k gk

" ################################################################################

" #PLUGIN CONFIGURATION#
" ----------------------

" Pathogen
execute pathogen#infect()

" ################################################################################
