call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'

"colorscheme"
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set laststatus=2
set hlsearch
set incsearch
set termguicolors
set noswapfile
set ignorecase
set smartcase
set autoread
set nocompatible
set wildmenu

colorscheme gruvbox 
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'

let NERDTreeShowHidden=1

"linters
let g:ale_linters = {'ruby': ['rubocop']}

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

let g:airline_section_y='%{LinterStatus()}'
let g:airline#extensions#tabline#enabled = 1

"mappings
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-y> :NERDTreeFind<CR>
nmap <C-p> :Files<cr>
nmap <C-f> :Ag<cr>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nnoremap c :bp\|bd #<CR>
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
