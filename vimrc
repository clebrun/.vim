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
Bundle 'xolox/vim-misc' " dependency for vim-notes
Bundle 'xolox/vim-notes'

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

nmap <leader>b :CtrlPBuffer<CR>

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>

" #Settings#
" ----------

" Sane should-be-defaults
syntax enable
filetype plugin indent on
set nocompatible " disable vi compatibility
set wildmenu " show auto-completion menu
set fdm=syntax " auto folds from syntax structures

" Appearence
colorscheme zenburn " for new color schemes, download into ~/.vim/colors
set colorcolumn=80 " highlight column 80
set cursorline " horizontal line highlights
set laststatus=2 " required for any statusline
set showmode " show current mode if not in command mode
set number " show line numbers
set guifont=Monospace\ 11 " try :set guifont=* for a graphical menu

" Fix
set t_ut= " Fix BCE (Background Color Erase)
set encoding=utf-8 " show utf-8 chars properly

" Files
set noswapfile " stop making swapfiles fucking *EVERYWHERE*
set hidden " don't make me save or force when switching buffers
set nobackup " disable backups
set autoread " if file change is made outside vim, reload file

" Whitespace
set smartindent " use vim's context sensitive auto indent
set expandtab " use spaces instead of tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2 " Softtabstob, Tabstop, and Shiftwidth need to be =
set listchars=tab:▸\ ,eol:¬ " Pretty unicode characters for whitespace when list is on

" Search
set ignorecase " Searches are case insensitive
set smartcase " unless they contain an uppercase character
set incsearch " Jumps to search as you search
set hlsearch " Highlights current search

" Scrolling
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Autocommands
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t fdm=marker

" [bufferflags] filename modified? | [fileformat] (row,column)
set statusline=%2*[%n%H%R%W]%*\ %f\ %m%=%1*%y%*%*\ %10((%l,%c)%)

" Sane tab behaviour. Insert tab if at the beggining of a line, otherwise...
" use autocompletion.
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

" #KEY MAPPINGS#
" --------------

" extra escape
imap <leader>. <ESC>
nmap <leader>. <ESC>
vmap <leader>. <ESC>

" quick go back
nnoremap <leader><leader> ``

"" Operations
" Re-source vimrc
nmap <leader>v :source $MYVIMRC<CR>

" vimrc
nmap <leader>ov :e ~/.vim/vimrc<CR> 

"" Settings
" Turn off search highlight
nmap <leader><space> :nohlsearch<CR>

" Copy and Paste
nmap <leader>xv :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vmap <leader>xc y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" j and k navigate absolutely as opposed to navigating linewise
nnoremap j gj
nnoremap k gk

" Next or previous occurrence of SEARCH is centered when jumped to
nnoremap n nzzzv
nnoremap N Nzzzv

" J and K go up and down a paragraph
nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {

" for Join functionality
nnoremap ,j J

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
