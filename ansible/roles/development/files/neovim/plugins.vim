call plug#begin()
    Plug 'nvim-lua/plenary.nvim' " Neotree, CodeGPT, Telescope
    Plug 'MunifTanjim/nui.nvim' " Neotree, CodeGPT
    Plug 'nvim-tree/nvim-web-devicons' " Neotree

    " Terminal colors plugin
    Plug 'jeffkreeftmeijer/vim-dim'

    " Neotree: tree-style file explorer
    Plug 'nvim-neo-tree/neo-tree.nvim'

    " Symbols Outline: LSP-powered symbols bar
    Plug 'simrat39/symbols-outline.nvim'

    " Treesitter: syntax parsing

    " Fugitive: :G* git commands
    Plug 'tpope/vim-fugitive'

    " Gitsigns: Ruler marks for git changes
    Plug 'lewis6991/gitsigns.nvim'

    " Jinja2 Syntax:
    Plug 'Glench/Vim-Jinja2-Syntax'

    " Telescope: Fuzzy searching
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

    " Syntaxes:
    Plug 'rust-lang/rust.vim'
    Plug 'hashivim/vim-hashicorp-tools'
    Plug 'cespare/vim-toml', { 'branch': 'main' }

    " Cocnvim: Completions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " CodeGPT: Code-oriented ChatGPT (req api key set as OPENAI_API_KEY)
    Plug 'dpayne/CodeGPT.nvim'
call plug#end()
