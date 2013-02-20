syntax enable
filetype plugin indent on

" GENERAL CONFIGURATION
" ---------------------
 
set nocompatible " disable vi compatability
set history=1000
set autoread
set noswapfile
set clipboard+=unnamed " Yanks go on clipboard instead
set showmode
set wildmenu

" Apperance Options
set background=dark
set ruler " Ruler on
set number " put line numbers on the side
set listchars=tab:▸\ ,eol:¬ " set tab chars to ▸ and end of line chars to ¬

" Case options
set ignorecase
set smartcase

" Search Options
set incsearch " Highlights searches
set hlsearch " Highlights current search
nmap \q :nohlsearch<CR> " Turn off hlsearch with \q

" Scroll options
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indentation options
set noexpandtab
set smartindent

" softtabstob, tabstop, and shiftwidth need to be =
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Buffer Options
set hidden " automagically make hidden buffers

" ################################################################################


" KEY MAPPINGS
" ------------

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
"" set shortcuts for window navigation
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" j and k don't navigate linewise
nmap j gj
nmap k gk

" ################################################################################

" PLUGIN CONFIGURATION
" --------------------

" Pathogen
execute pathogen#infect()

" ################################################################################
