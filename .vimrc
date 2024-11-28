let mapleader = " "
set backspace=indent,eol,start
set clipboard=unnamedplus
set encoding=utf-8
set hidden
set ignorecase
set incsearch
set laststatus=2
set mouse+=a
set nocompatible
set noerrorbells visualbell t_vb=
set number
set relativenumber
set shortmess+=I
set smartcase
set smartindent
set ts=2 sw=2 et
syntax on

" Key bindings
imap jk <Esc>
nmap Q <Nop>

nmap j gj
nmap k gk
vmap j gj
vmap k gk

nnoremap <leader>\| :vsp<CR>
nnoremap <leader>- :sp<CR>
nnoremap <leader>qq :qa<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <leader>bd :bd<CR>
nmap <leader>bo :only<CR>

nmap L gt
nmap H gT

" Plugin options filetype plugin on
" vim-plug
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'bkad/CamelCaseMotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'github/copilot.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
call plug#end()

" lightline.vim
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = { 'colorscheme': 'wombat' }

" nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ycm
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates
let g:ycm_clangd_binary_path = exepath("clangd")

