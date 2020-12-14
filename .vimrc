set nocompatible              " be iMproved, required
filetype off                  " required

" vim-plug init
call plug#begin('~/.vim/plugged')

" General enhancements
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'

" UI
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

" Syntax & Languages
Plug 'leafOfTree/vim-vue-plugin'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

" Completion & linting
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set background=dark
colorscheme apprentice

let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='dark'

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Usefull vim rc stuff
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful

" Auto indent colors
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

let g:vim_vue_plugin_load_full_syntax = 1

" Compatibility with old vim versions
set encoding=utf-8

" http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set scrolloff=5
set autoindent
set showmode
set showcmd
set nowrap

set noundofile

" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline

" http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmenu
set wildmode=list:longest
" set mouse=a

" Highlight search and smart case
set incsearch
set hlsearch
set ignorecase
set smartcase

" http://vim.wikia.com/wiki/Disable_beeping
set visualbell

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

set nobackup
set nowritebackup
set noswapfile
set backupdir=./tmp
set directory=./tmp
set undodir=./tmp

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set incsearch

set pastetoggle=<F2>

set nocp
filetype plugin on

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

xnoremap p pgvy

syntax enable
filetype plugin indent on

let g:polyglot_disabled = ['python.shiftwidth', 'python.softtabstop']
au BufWritePre * :%s/\s\+$//e
au BufNewFile,BufRead *.rabl set filetype=ruby
au BufNewFile,BufRead *.json set filetype=ruby
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.slim set filetype=slim
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.vue set filetype=html
au BufNewFile,BufRead *.py set expandtab shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.sol set expandtab shiftwidth=2 softtabstop=2

" CtrlP ignore folder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*

" Auto comment
map <c-c> <Esc>0i#<Esc>$

" Work without arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set runtimepath^=~/.vim/bundle/ctrlp.vim

set grepprg=ack\ -k
cnoreabbrev Ack Ack!

nnoremap <Leader>f :Ack! --ignore-dir=tmp<Space>

let g:ackprg = 'ag --vimgrep'

noremap <leader>w :w!<cr>
noremap <Leader>q :q<CR>
noremap <Leader>x :x<CR>

noremap <Leader>b obinding.pry<Esc>

noremap <Leader>n :tab sp<cr>

set wmh=0
map <c-k> <Esc><c-w>s
map <Leader>k <Esc><c-w>s
map <c-h> <Esc><c-w>v
map <Leader>h <Esc><c-w>v
map <c-j> <Esc><c-w>s<c-w>j
map <Leader>j <Esc><c-w>s<c-w>j
map <c-l> <Esc><c-w>v<c-w>l
map <Leader>l <Esc><c-w>v<c-w>l
nmap <s-h> <c-w>h
nmap <s-j> <c-w>j
nmap <s-k> <c-w>k
nmap <s-l> <c-w>l

imap jk <Esc>

nmap <Leader>z <c-d>

map <Leader>p <c-p>
:verbose map <Leader>r <F5>

noremap <Leader>d <Esc>:NERDTree %<CR>
noremap <Leader>e <Esc>:e .<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Plain text view
function! PlainView()
  setlocal nonumber norelativenumber
  setlocal foldcolumn=0
  setlocal nocursorline nocursorcolumn
  setlocal nohlsearch nolist
  syntax off
  setlocal colorcolumn=
endfunction

nnoremap <leader>pv :call PlainView()<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
