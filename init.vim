" Basic settings {{{
  " set spell spelllang=en_us
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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tmhedberg/SimpylFold'
  Plug 'Raimondi/delimitMate'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'Shougo/unite.vim'
  Plug 'morhetz/gruvbox'
  Plug 'posva/vim-vue'
  Plug 'cespare/vim-toml'
  Plug 'lepture/vim-jinja'
  Plug 'nathangrigg/vim-beancount'

  call plug#end()

" }}}

  colorscheme gruvbox

" Plugin settings {{{

  autocmd BufNewFile,BufRead *.tera set ft=jinja

  " Hide .pyc, .html.py in nerdtree
  let NERDTreeIgnore = ['\.pyc$', '\.html.py$', '\.egg-info$', '__pycache__']
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1

  " coc settings
  let g:coc_global_extensions = ['coc-pyright', 'coc-solargraph', 'coc-rls', 'coc-go', 'coc-css', 'coc-html']

  " let g:airline_theme="solarized"
  let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled=1

" }}}


" Key mappings {{{
  let mapleader = ','

  nmap <Leader>p :Files<CR>
  nmap <Leader>o :Buffers<CR>
  nmap <Leader>l :Lines<CR>

  " buffer switch
  nnoremap <C-N> :bn<CR>
  nnoremap <C-P> :bp<CR>

  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  nnoremap <silent><Leader>, :Unite -silent buffer<CR>

  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" }}}

