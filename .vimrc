" Basic options based on https://missing.csail.mit.edu/2020/editors/
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set backspace=indent,eol,start
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
syntax on

" Plugin options
filetype plugin on
" vim-plug
call plug#begin()
Plug 'bkad/CamelCaseMotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'preservim/nerdtree'
Plug 'preservim/vim-indent-guides'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
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
nnoremap <C-S-E> :NERDTree<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim-indent-guides
set ts=2 sw=2 et
set background=dark
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1

" ycm
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates
let g:ycm_clangd_binary_path = exepath("clangd")

" Let vim automatically infer indents based on context
set smartindent

" Mapping configurations
let mapleader = " " " leader is space
" Map jk to <ESC>
imap jk <ESC>
" Move vertically by visual line
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Handle windows quicker
nnoremap <leader>\| :vsp<CR>
nnoremap <leader>- :sp<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
