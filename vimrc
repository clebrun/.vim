" echo ">^.^<"
" ##############################################################################

" #PLUGIN CONFIGURATION#
" ----------------------
" if statements keep this config portable. Don't litter.

" Pathogen
" if has("pathogen")
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" endif

" Syntastic

" CtrlP
if has("CtrlP")
	" map <C-p> to open CtrlP
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlPMixed'
	let g:ctrlp_match_window_bottom = 0
	let g:ctrlp_match_window_reversed = 0
	let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
	let g:ctrlp_working_path_mode = 0
	let g:ctrlp_dotfiles = 0
	let g:ctrlp_switch_buffer = 0
endif

" NerdTree
" has("NERDTree")
nmap <leader>e :NERDTreeToggle<CR>
" endif

" Powerline

" ##############################################################################

" #SETTINGS#
" ----------
 
set nocompatible " disable vi compatibility
set laststatus=2
set history=1000
set autoread
set noswapfile
set clipboard+=unnamed " Yanks go on clipboard instead
set showmode
set wildmenu
set spell
set backupdir=~/tmp
set encoding=utf-8
syntax enable
filetype plugin indent on

" Appearance Options
colorscheme zenburn " for new colorschemes, download into ~/.vim/colors
" colorscheme mayansmoke
set listchars=tab:▸\ ,eol:¬ " set tab chars to ▸ and end of line chars to ¬
set number

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
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Buffer Options
set hidden " make hidden buffers automagically 

" ##############################################################################

" #KEY MAPPINGS#
" --------------

" Window Navigation
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" Buffer Navigation
"" Go to last buffer with <C-e>
nmap <C-e> :b#<CR>

" Leader Commands
" ---------------
"" Open Commands
nmap <leader>ov :e ~/.vim/vimrc<CR> 
nmap <leader>oc :e ~/.vim/cheatsheet.txt<CR> 
nmap <leader>ow :e ~/Docs/work_notes.txt<CR> 
nmap <leader>os :e ~/Docs/scratch.txt<CR> 
"" Close/Delete commands
nmap <leader>k :bd<cr>
nmap <leader>!k :bd!<cr>
"" Goto Commands
nmap <leader>gc :e ~/Code/<CR> 
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
"" Settings Changes
nmap <leader>V :source $MYVIMRC<cr>
nmap <leader>sr :set rnu<CR> 
nmap <leader>sn :set number<CR> 
nmap <leader>nh :nohlsearch<CR> 
nmap <leader>ns :set nospell<CR> 
nmap <leader><leader> :CtrlPMixed<CR>
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

" ##############################################################################

