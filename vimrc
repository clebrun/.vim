" <space> as leader
let mapleader = " "
let g:mapleader = " "

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
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'xolox/vim-misc' 
Bundle 'xolox/vim-notes'
Bundle 'Shougo/unite.vim'
Bundle 'skalnik/vim-vroom'

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>

" vim-notes
let g:notes_directories=['~/Documents/Notes']

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
nmap <leader>p :Unite file_rec<CR>
nmap <leader>b :Unite buffer<CR>
nmap <leader>y :Unite history/yank<CR>

" #Settings#
" ----------

" colorscheme
let g:solarized_termcolors=256 " in case I want to switch to solarized
colorscheme zenburn

set shell=zsh " use zsh instead of bash
set mouse=a " enable mouse

" Sane should-be-defaults
syntax enable
filetype plugin indent on
set nocompatible " disable vi compatibility
set wildmenu " show auto-completion menu
set fdm=syntax " auto folds from syntax structures

" Appearence
set colorcolumn=80 " highlight column 80
set cursorline " horizontal line highlights
set laststatus=2 " required for any statusline
set showmode " show current mode if not in command mode
set guifont=Monospace\ 11 " try :set guifont=* for a graphical menu
set t_Co=256

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
" set formating/folding options when in a txt file
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t fdm=marker

" put cursor in last position unless its invalid or in an event handler
autocmd Bufreadpost *
      \ if line("'\'") > 0 && line("'\'") <= line("$") |
      \   exe "normal g`\"" |
      \ endif


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
"imap <leader>. <ESC>
"nmap <leader>. <ESC>
"vmap <leader>. <ESC>

" kill buffer without killing split
nnoremap <C-c> :bp\|bd #<CR>

" quick write
nnoremap <leader><leader> :w<CR>

" quick save sessions
nnoremap <leader>sh :mks! .session.vim<cr>
nnoremap <leader>ss :mks! ~/.vim/sessions/last.vim<cr>

" quick switch
nnoremap <leader>. :b#<CR>

" filesearch using :e
nmap <leader>e :e **/

" goto vimrc
nmap <leader>ov :e ~/.vim/vimrc<CR> 

"" Settings
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T

"" Mappings

" Copy and Paste
nmap <leader>xv :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vmap <leader>xc y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" remap , to the split handling prefix. DEF KEEPING THIS OMG
nnoremap <silent> , <C-w>
vnoremap <silent> , <C-w>

" j and k navigate absolutely as opposed to navigating linewise
nnoremap j gj
nnoremap k gk

" Next or previous occurrence of SEARCH is centered when jumped to
nnoremap n nzzzv
nnoremap N Nzzzv

" J and K go up and down a paragraph
nnoremap J 8j
nnoremap K 8k
vnoremap J 8j
vnoremap K 8k

" for Join functionality
nnoremap <leader>j J

" H and L now do 0 and $
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" for regular H and L functionality
nnoremap <leader>H H
nnoremap <leader>L L

" Don't move when * is invoked, just search
nnoremap * *<c-o>

" make Y behave like other capitals
nnoremap Y y$

" Takes a name of a program and generates a hashbang (e.g. #!/usr/bin/bash)
map <F2> 0v$hy0D:r! which <C-R>0<CR>I#!<esc>kJ

" set capslock to be a second escape on linux
map <F3> :! setxkbmap -option caps:escape<CR>

" Insert Date/Time stamp
nmap <F4> :r! date '+%Y-%m-%d %H%M'<CR>

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
