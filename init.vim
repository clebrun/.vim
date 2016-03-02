" Vundle plugin manager boilerplate
" BEGIN
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
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
Plugin 'sjl/badwolf'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'vim-ruby/vim-ruby'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Ruby
Plugin 'ngmy/vim-rubocop'
"Plugin 'tpope/vim-cucumber'
Plugin 'skalnik/vim-vroom'

" Clojure
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-leiningen'
"Plugin 'neovim/node-host'
"Plugin 'snoe/nvim-parinfer.js'

" Misc
"Plugin 'tomtom/tlib_vim'
" fuzzy file search
Plugin 'kien/ctrlp.vim'
" easy gisting, easy life
Plugin 'mattn/gist-vim'
" gist-vim depends on:
Plugin 'mattn/webapi-vim'
" move around a file easier, mapped to <leader><leader>
Plugin 'easymotion/vim-easymotion'
" Give me a hard time for using hjkl repeatedly
Plugin 'takac/vim-hardtime'

call vundle#end()

" alternate leader key: , instead of \
let mapleader = ","
let g:mapleader = ","

" Gist plugin settings
let g:gist_post_anonymous = 1
vnoremap <leader>G :Gist -a -b<CR>

" vim-hardtime settings
" default on
let g:hardtime_default_on = 1
" set timeout length
let g:hardtime_timeout = 100

" Settings
set scrolloff=4
set number
set relativenumber
set shell=zsh
set colorcolumn=81
set clipboard=unnamedplus

" COLORSCHEME
colorscheme hybrid_material
set t_Co=256
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

syntax enable
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
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

" center search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" Y yanks to end of line like other capitals
map Y y$

" Remap H and L to go to the beginning and end of the line  
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" melody option for split navigation
nnoremap <leader>w <c-w>

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Use ,, as esc
inoremap <leader>. <ESC>
nnoremap <leader>. <ESC>
vnoremap <leader>. <ESC>

" code completion in insert mode
inoremap <leader><leader> <C-p>

" force vim-vroom mapping
nnoremap <leader>r :VroomRunTestFile<CR>

" tabs
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tv :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <leader>ts :tabnew ~/.vim/bundle/vim-snippets/snippets<CR>

" NERDtree
nnoremap <leader>n :NERDTreeToggle<CR>


" Pry
"nnoremap <leader>p :! pry<CR>
"nnoremap <leader>P :! pry -r %<CR>

" Ctrl-P
nnoremap <leader>p :CtrlPMixed<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" go into haskell repl with current file loaded
nnoremap <leader>g :! ghci %<CR>

" source vimrc
nnoremap <leader>v :source ~/.config/nvim/init.vim<CR>

" Easy Align Mappings
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Eval whole file (clojure, vim-fireplace)
"nnoremap <leader>E :%Eval<CR>

" Quick magic search
nnoremap <leader>/ /\v

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

" Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" 
nmap <space> <Plug>(easymotion-bd-f)

" Syntastic
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
nnoremap <leader>se :Errors<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" EXPERIMENTAL, DO NOT COMMIT
set ttimeoutlen=-1

" Terminal shortcuts
tnoremap <leader>e <C-\><C-n>
