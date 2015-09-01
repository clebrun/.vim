" Vundle plugin manager boilerplate
" BEGIN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"" Plugins Groups
" Default
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-expand-region'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Colorschemes
Plugin 'endel/vim-github-colorscheme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'sickill/vim-monokai'

" Clojure
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-leiningen'
"Plugin 'kien/rainbow_parentheses.vim'

" Misc
"Plugin 'tomtom/tlib_vim'
"Plugin 'skalnik/vim-vroom'
"Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'ngmy/vim-rubocop'

call vundle#end()

" alternate leader key: , instead of \
let mapleader = ","
let g:mapleader = ","

" Settings
set scrolloff=4
set number
set relativenumber
set shell=zsh
set colorcolumn=80

set background=dark " to get dark gruvbox
colorscheme zenburn
set t_Co=256

syntax enable
filetype plugin indent on
set nocompatible
set wildmenu
set showmode
set laststatus=2
set noswapfile
set hidden
set nobackup
set autoread
" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
" indentation rules
set smartindent " Auto indent
set expandtab " use spaces as tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Mappings
nnoremap j gj
nnoremap k gk

nnoremap n nzzzv
nnoremap N Nzzzv

" Y yanks to end of line like other capitals
map Y y$

" Remap H and L to go to the beginning and end of the line  
nnoremap H ^
vnoremap H ^

nnoremap L g_
vnoremap L g_

" this helps with split navigation
nnoremap <leader>w <c-w>

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Use ,, as esc
inoremap <leader>. <ESC>
nnoremap <leader>. <ESC>
vnoremap <leader>. <ESC>

" code completion in insert mode
inoremap <leader><leader> <C-n>

" tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tv :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>ts :tabnew ~/.vim/bundle/vim-snippets/snippets<CR>

" NERDtree
nnoremap <leader>n :NERDTreeToggle<CR>


" Ruby
nnoremap <leader>r :! ruby %<CR>

" Pry
"nnoremap <leader>p :! pry<CR>
"nnoremap <leader>P :! pry -r %<CR>

" Ctrl-P
nnoremap <leader>p :CtrlPMixed<CR>

" go into haskell repl with current file loaded
nnoremap <leader>g :! ghci %<CR>

" source vimrc
nnoremap <leader>R :source ~/.vim/vimrc<CR>

" Easy Align Mappings
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Eval whole file (clojure, vim-fireplace)
"nnoremap <leader>E :%Eval<CR>

" Expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"tabs 
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>th gT
nnoremap <leader>tl gt
nnoremap <leader>tH :tabm -1<CR>
nnoremap <leader>tL :tabm +1<CR>

" Syntastic
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
nnoremap <leader>se :Errors<CR>
nnoremap <leader>sr :SyntasticReset<CR>
