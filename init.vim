" vim-plug plugin manager boilerplate
set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

"" Plugs Groups
" Default
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-expand-region'
Plug 'nathanaelkane/vim-indent-guides'

" Snippets
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Colorschemes
Plug 'endel/vim-github-colorscheme'
Plug 'Lokaltog/vim-distinguished'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'sickill/vim-monokai'
Plug 'sjl/badwolf'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-ruby/vim-ruby'
Plug 'AlessandroYorba/Alduin'
Plug 'mswift42/vim-themes'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'ngmy/vim-rubocop'
"Plug 'tpope/vim-cucumber'
Plug 'skalnik/vim-vroom'
Plug 'nelstrom/vim-textobj-rubyblock' | Plug 'kana/vim-textobj-user'

" Clojure
"Plug 'guns/vim-clojure-static'
"Plug 'tpope/vim-classpath'
"Plug 'tpope/vim-fireplace'
"Plug 'tpope/vim-leiningen'
"Plug 'neovim/node-host'
"Plug 'snoe/nvim-parinfer.js'
"Plug 'vim-scripts/paredit.vim'

" Misc
"Plug 'tomtom/tlib_vim'
" fuzzy file search
Plug 'kien/ctrlp.vim'
" easy gisting, easy life
Plug 'mattn/gist-vim'
" gist-vim depends on:
Plug 'mattn/webapi-vim'
" move around a file easier, mapped to <leader><leader>
Plug 'easymotion/vim-easymotion'
" Give me a hard time for using hjkl repeatedly
Plug 'takac/vim-hardtime'

call plug#end()

runtime macros/matchit.vim

" map common ex-command typos to their intended commands
command! Q q
command! W w

" Execute macro in q
map Q @q

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
set list listchars=tab:▸\ ,eol:¬

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

" quick write
nnoremap <leader><leader> :w<CR>

" force vim-vroom mapping
nnoremap <leader>r :VroomRunTestFile<CR>

" tabs
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tv :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <leader>ts :tabnew ~/.config/nvim/bundle/vim-snippets/snippets<CR>

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

" Fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" <space><char> opens bi-directional easymotion character match
nmap <space> <Plug>(easymotion-bd-f)

" Syntastic
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
nnoremap <leader>se :Errors<CR>
nnoremap <leader>sr :SyntasticReset<CR>

" EXPERIMENTAL, DO NOT COMMIT
set ttimeoutlen=-1

" Terminal shortcuts
tnoremap <leader>e <C-\><C-n>
