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
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Yggdroot/indentLine'

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
set clipboard=unnamedplus

let NERDTreeShowHidden=1

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='medium'
colorscheme gruvbox

" ALE colors
highlight ALEWarning ctermbg=DarkMagenta
highlight ALEWarning ctermfg=Black
highlight ALEError ctermbg=DarkRed
highlight ALEError ctermfg=White
highlight WhitespaceEOL ctermbg=red guibg=#ab0d0d
match WhitespaceEOL /\s\+\%#\@<!$/

"linters
let g:ale_linters = {
\  'ruby': ['rubocop'],
\  'javascript': ['eslint']
\}

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

au FocusGained,BufEnter * :checktime

"mappings
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-y> :NERDTreeFind<CR>
nmap <C-p> :Files<CR>
nmap <C-f> :Ag<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap c :bp\|bd #<CR>
nmap <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark" ) \| :highlight ALEWarning ctermbg=Red ctermfg=Black<CR>
"Remove all trailing whitespaces
nnoremap <C-t> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
