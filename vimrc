" ################################################################################

" #PLUGIN CONFIGURATION#
" ----------------------
" if statements keep this config portable. Don't litter.

" Pathogen
if has("Pathogen")
	execute pathogen#infect()
endif

" Syntastic

" CtrlP
if has("CtrlP") 
	" map <C-p> to open CtrlP
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_match_window_bottom = 0
	let g:ctrlp_match_window_reversed = 0
	let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
	let g:ctrlp_working_path_mode = 0
	let g:ctrlp_dotfiles = 0
	let g:ctrlp_switch_buffer = 0
endif

" ################################################################################

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
colorscheme zenburn " for new colorschemes, download into ~/.vim/colors
set listchars=tab:▸\ ,eol:¬ " set tab chars to ▸ and end of line chars to ¬
set rnu " initialize rnu so that when you start you don't have an empty side

" source the vimrc file after saving it
if has("autocmd")
	" if you save your vimrc, reload your vimrc
	autocmd bufwritepost vimrc source $MYVIMRC

	" set number when in insert mode, set relativenumber when you leave insert mode
	autocmd InsertEnter * :set number
	autocmd InsertLeave * :set relativenumber
endif

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

" Window Navigation
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" Buffer Navigation
nmap <C-e> :b#<CR> " Switch to last buffer with Ctrl-e

" Leader Commands
" ---------------
"" Open Commands
nmap \ov :e ~/.vim/vimrc<CR> " open your vimrc in a new buffer
nmap \oc :e ~/.vim/cheatsheet.txt<CR> " open your cheatsheet in a new buffer
nmap \ow :e ~/Docs/work_notes.txt<CR> " open work_notes in a new buffer
nmap \os :e ~/Docs/scratch.txt<CR> " Open scratch pad
"" Goto Commands
nmap \gc :e ~/Code/<CR> " Opens code directory
"" Settings Changes
nmap \sr :set rnu<CR> " set relative number
nmap \sn :set number<CR> " set standard number
nmap \nh :nohlsearch<CR> " Turn off search highlights
nmap \ns :set nospell<CR> " turn off spellchecker and spell highlighting
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

" ################################################################################

