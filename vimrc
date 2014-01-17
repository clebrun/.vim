" <change <leader> from \ to ,
let mapleader = ","
let g:mapleader = ","

" ##############################################################################
" TODO: learn basic vimscript, rewrite pluging configuration to not break vim
" if the plugin is not installed.

" #PLUGIN CONFIGURATION#
" ----------------------

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
Bundle 'gmarik/vundle'
" maybe just go with a vanilla but pimp statusline?
"Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
" 3 dependencies for snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-rails'
"Bundle 'Valloric/YouCompleteMe'

" TODO figure out how to make ctrlp flush its buffer when needed
" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 1
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>

"############################################################################## 

" #Settings#
" ----------

syntax enable
filetype plugin indent on

set nobackup " disable backups
set autoread
set lazyredraw " Performance tweak, don't redraw while executing macros
set history=500 " keep up to 50 previous commands
set laststatus=2 " required for any statusline
set nocompatible " disable vi compatibility
set backspace=2
set sc
set hidden " make hidden buffers automagically 
set noswapfile " stop making swapfiles fucking *EVERYWHERE*
set encoding=utf-8 " show utf-8 chars properly
set showmode " Not needed when powerline is on
set guifont=Monospace\ 11 " try :set guifont=* for a graphical menu
"set spell " spell-check on by default
set wildmenu " show auto-completion menu
colorscheme zenburn " for new color schemes, download into ~/.vim/colors
set cursorline " horizontal line highlights
set expandtab " don't use tab characters
set smartindent " use vim's context sensitive auto indent
set listchars=tab:▸\ ,eol:¬ " Pretty unicode characters for whitespace when list is on
set number " show line numbers
set colorcolumn=80 " highlight column 80
set t_ut= " Prevent BCE (Background Color Erase)
" Softtabstob, Tabstop, and Shiftwidth need to be =
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Filetype specific options
" use formating options if editing a plain text file
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t

" Search Options
set ignorecase " Searches are case insensitive
set smartcase " unless they contain an uppercase character
set incsearch " Jumps to search as you search
set hlsearch " Highlights current search

" Scroll Options
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Statusline
" [bufferflags] filename modified? | [fileformat] (row,column)
set statusline=%2*[%n%H%R%W]%*\ %f\ %m%=%1*%y%*%*\ %10((%l,%c)%)

"############################################################################## 
"
" #FUNCTIONS#
" -----------

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <c-tab> <c-n>


"############################################################################## 

" #KEY MAPPINGS#
" --------------

" extra escape
imap <leader>. <ESC>
nmap <leader>. <ESC>
vmap <leader>. <ESC>

" Go to last buffer
"nmap ,. :b#<CR>

"" Operations
" Re-source
nmap <leader>v :source $MYVIMRC<CR>
" Reformat current paragraph
nmap <leader>g gqip
" Default testing mapping
nmap <leader>tt :! bundle exec rspec<CR>
" Save
nmap <leader>w :w<cr>

" Make a separator out of -s that is equal in length to the current line
map <leader>l yypVr-

" CtrlP
"nmap <leader>p :CtrlPMixed<CR>
nmap <leader>b :CtrlPBuffer<CR>

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
"nmap <leader>sf :set ft=

" Toggles
" Spell-check
nmap <leader>ts :set spell!<CR> 

" Copy and Paste
"nmap <leader>V :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
"vmap <leader>c y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" j and k navigate absolutely as opposed to navigating linewise
nnoremap j gj
nnoremap k gk

" Next or previous occurrence of SEARCH is centered when jumped to
nnoremap n nzzzv
nnoremap N Nzzzv

" J and K go up and down a paragraph
nnoremap J }
nnoremap K {

" H and L now do 0 and $
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Don't move when * is invoked, just search
nnoremap * *<c-o>

" make Y behave like other capitals
nnoremap Y y$

" Takes a name of a program and generates a hashbang (e.g. #!/usr/bin/bash)
map <F2> 0v$hy0D:r! which <C-R>0<CR>I#!<esc>kJ

" Todo commands
nmap <leader>td A #DONE<esc>
nmap <leader>tud V:s/#DONE//g<CR>

" Build commands, format <leader>r[un](first letter of language)
nmap <leader>rr :w\|:! ruby %<CR>

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
