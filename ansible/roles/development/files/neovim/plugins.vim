call plug#begin()
    " Terminal colors plugin
    Plug 'jeffkreeftmeijer/vim-dim'

    " Neotree: tree-style file explorer
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'nvim-neo-tree/neo-tree.nvim'

    " Treesitter: syntax parsing
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Fugitive: :G* git commands
    Plug 'tpope/vim-fugitive'

    " Jinja2 Syntax:
    Plug 'Glench/Vim-Jinja2-Syntax'

    " Telescope: Fuzzy searching
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

"   " Syntaxes:
"   Plug 'rust-lang/rust.vim'
"   Plug 'hashivim/vim-hashicorp-tools'
"   Plug 'cespare/vim-toml', { 'branch': 'main' }

    " Cocnvim Completions:
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
