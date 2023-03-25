if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

  Plug 'mhinz/vim-startify'

  " nvim-treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', { 'as': 'dracula' }

  " fuzzy finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " nvim-tree
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'

  " lualine, replace airline
  Plug 'nvim-lualine/lualine.nvim'

  " nvim-cmp
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " null-ls
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " Functionalities
  Plug 'dkarter/bullets.vim'

  call plug#end()

" }}}


if exists(':PlugStatus')

" colorscheme gruvbox
colorscheme dracula

" Plugin settings (lua) {{{
lua << EOF
require('nvim-treesitter.configs').setup({
  ensure_installed = {'python'},
  sync_install = false,
  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
  },
})
require('telescope').load_extension('fzf')
require('lualine').setup()
require("nvim-tree").setup()
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
	{ name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
	{ name = 'path' }
  }, {
	{ name = 'cmdline' }
  })
})
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pyright.setup({
    capabilities = capabilities
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
EOF
" }}}
endif

" Key mappings {{{
  let mapleader = ','
  nnoremap <leader>ev :e $MYVIMRC<CR>

  " Find files using Telescope command-line sugar.
  nnoremap <leader>p <cmd>Telescope find_files<cr>
  nnoremap <leader>o <cmd>Telescope buffers<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
  nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

  nmap <leader>q :NvimTreeToggle<CR>
  nmap \ <leader>q

" }}}
