" Basic settings {{{
  set spell spelllang=en_us
  set encoding=utf-8

  set number
  set expandtab
  set smartindent
  set smarttab
  set autoindent
  set softtabstop=4
  set shiftwidth=2
  set tabstop=4
  set termguicolors
  set background=dark
  set ffs=unix,dos,mac  
  set incsearch                   " incremental searching
  set showmatch                   " show pairs match
  set hlsearch                    " highlight search results
  set smartcase                   " smart case ignore
  set ignorecase                  " ignore case letters
  set textwidth=80
  set colorcolumn=81

  " colorscheme molokai256
  colorscheme solarized

  syntax on
  filetype on
  filetype plugin indent on

  set undofile
  set undodir=~/.config/nvim/undodir

  set foldmethod=indent
  set foldlevel=99
  
" }}}

" Plugins {{{

  call plug#begin()

  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-markdown'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'Valloric/YouCompleteMe'
  Plug 'tmhedberg/SimpylFold'
  Plug 'Raimondi/delimitMate'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'Shougo/unite.vim'

  call plug#end()

" }}}

" Plugin hettings {{{

  " Hide .pyc, .html.py in nerdtree
  let NERDTreeIgnore = ['\.pyc$', '\.html.py$', '\.egg-info$', '__pycache__']
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>', '<Up>']
  let g:syntastic_check_on_open=1

" }}}


" Key mappings {{{
  let mapleader = ','

  nmap <Leader>p :Files<CR>
  nmap <Leader>o :Buffers<CR>
  nmap <Leader>l :Lines<CR>

  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  nnoremap <silent><Leader>, :Unite -silent buffer<CR>

" }}}

