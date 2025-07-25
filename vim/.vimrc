" -----------------------------
" BlockLune's Vim Configuration
" -----------------------------

" Plugin options
filetype plugin on
" vim-plug
call plug#begin()
Plug 'ap/vim-buftabline'
" Plug 'bkad/CamelCaseMotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
" Plug 'easymotion/vim-easymotion'
" Plug 'github/copilot.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key'
Plug 'mg979/vim-visual-multi'
Plug 'mhinz/vim-startify'
Plug 'nelstrom/vim-visual-star-search'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'takac/vim-hardtime'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wakatime/vim-wakatime'
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
call plug#end()

" Run `:help option-list` to learn more
set clipboard=unnamed
set encoding=utf-8
set expandtab
set hidden
set ignorecase
set mouse+=a
set nobackup
set noerrorbells visualbell t_vb=
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=10
set shiftwidth=2
set shortmess+=I
set smartcase
set smartindent
set smarttab
set tabstop=2

" Key bindings
let mapleader = " "

imap jk <Esc>
nmap Q <Nop>
vnoremap p pgvy

nnoremap <leader>\| :vsp<CR>
nnoremap <leader>- :sp<CR>

nnoremap <leader>qq :qa<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader><up> :resize +2<cr>
nmap <leader><down> :resize -2<cr>
nmap <leader><left> :vertical resize -2<cr>
nmap <leader><right> :vertical resize +2<cr>

" The function BufDel is from Bclose of
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"
" Don't close window, when deleting a buffer
function! BufDel()
  let l:currentBufNum = bufnr('%')
  let l:alternateBufNum = bufnr('#')

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr('%') == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute('bdelete! '.l:currentBufNum)
  endif
endfunction

function! BufOnly()
  let l:currentBufNum = bufnr('%')
  bufdo if &modified == 0 && bufnr('%') != l:currentBufNum | call BufDel() | endif
endfunction

nmap <leader>bd :call BufDel()<CR>
nmap <leader>bo :call BufOnly()<CR>
nmap <leader>bl :ls<CR>
nmap H :bprev<CR>
nmap L :bnext<CR>

" ctrlp
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_show_hidden = 1

" lightline.vim
set noshowmode
if !has('gui_running')
  set t_Co=256
endif

" nerdtree
let NERDTreeShowHidden = 1
nnoremap <leader>e :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim-hardtime
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 3
let g:hardtime_motion_with_count_resets = 1
let g:hardtime_showmsg = 1

" ycm
" let g:ycm_clangd_uses_ycmd_caching = 0 " Let clangd fully control code completion
" let g:ycm_clangd_binary_path = exepath("clangd") " Use installed clangd, not YCM-bundled clangd which doesn't get updates

" vim-which-key
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
