" cooperlebrun@gmail.com
" ##############################################################################
" TODO: learn basic vimscript, rewrite pluging configuration to not break vim
" if the plugin is not installed.

" #PLUGIN CONFIGURATION#
" ----------------------
" if statements keep this config portable. Don't litter.
" test test test ( test test test"")
" Pathogen " THIS HAS TO GO FIRST
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

"############################################################################## 
" #General Configuration#
" -----------------------
 
set autoread
set history=1000
set laststatus=2
set nocompatible " disable vi compatibility
set noswapfile
set backupdir=~/backups/vim
set encoding=utf-8
set showmode
"set spell
set wildmenu
syntax enable
filetype plugin indent on

" Appearance Options
colorscheme zenburn " for new colorschemes, download into ~/.vim/colors
"colorscheme smyck " for new colorschemes, download into ~/.vim/colors
set cursorcolumn
set cursorline
set listchars=tab:▸\ ,eol:¬
"set number
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

" Folding
set foldmethod=indent
set foldlevel=99

" Filetype specific options
" use formating options if editing a plain text file
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80 formatoptions=t

" #KEY MAPPINGS#
" --------------

" Window Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Go to last buffer with <C-e>
nmap <C-e> :b#<CR>

" Leader Commands
" ---------------
nmap <leader>!k :bd!<CR>
nmap <leader><leader> :w<CR>
nmap <leader><space> :nohlsearch<CR> 
nmap <leader>Q :q!<CR>
nmap <leader>V :source $MYVIMRC<CR>
nmap <leader>W :w!<CR>
nmap <leader>gc :e ~/Code/<CR> 
nmap <leader>k :bd<CR>
nmap <leader>l yypVr-yy
nmap <leader>n :bn<CR>
nmap <leader>ns :set nospell<CR> 
nmap <leader>nts :e ~/Docs/notes/notes_to_self.txt<CR> 
nmap <leader>oc :e ~/.vim/cheatsheet.txt<CR> 
nmap <leader>om :e ~/.muttrc<CR> 
nmap <leader>on :e ~/Docs/notes/
nmap <leader>os :e ~/Docs/notes/scratch.txt<CR> 
nmap <leader>ot :e ~/.tmux.conf<CR> 
nmap <leader>ou :e ~/.newsbeuter/urls<CR> 
nmap <leader>ov :e ~/.vim/vimrc<CR> 
nmap <leader>ow :e ~/Docs/notes/work_notes.txt<CR> 
nmap <leader>oz :e ~/.zshrc<CR> 
nmap <leader>p :CtrlPMixed<CR>
nmap <leader>p :bp<CR>
nmap <leader>q :q<CR>
nmap <leader>ss :set spell!<CR> 
nmap <leader>sn :set number<CR> 
nmap <leader>sr :set rnu<CR> 
nmap <leader>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vmap <leader>c y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vnoremap <leader>a :Align\|<cr>
vnoremap <leader>s :sort<CR>
" ---------------

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

" Press jk in insert mode to get back to normal mode
"inoremap kj <esc>

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
