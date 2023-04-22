local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { -- Terminal colors plugin
        'jeffkreeftmeijer/vim-dim',
    },
    { -- Neotree: tree-style file explorer
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
        }
    },
    { -- Alt status line
        'bluz71/nvim-linefly',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },
    {
        'b0o/incline.nvim'
    },
    {
        'mfussenegger/nvim-dap',
    },
    { -- Symbols Outline: LSP-powered symbols bar
        'simrat39/symbols-outline.nvim',
    },
    { -- Treesitter: syntax parsing
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { -- Fugitive: :G* git commands
        'tpope/vim-fugitive',
    },
    { -- Gitsigns: Ruler marks for git changes
        'lewis6991/gitsigns.nvim',
    },
    { -- Jinja2 Syntax:
        'Glench/Vim-Jinja2-Syntax',
    },
    { -- Telescope: Fuzzy searching
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    { -- mason.nvim
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        }
    },
    { --lsp setup helper
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'onsails/lspkind.nvim',
        },
    },
    { -- CodeGPT: Code-oriented ChatGPT (req api key set as OPENAI_API_KEY)
        'dpayne/CodeGPT.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
          require("codegpt.config")
          for _, key in ipairs({'tests', 'completions', 'code_edit', 'doc', 'opt'}) do
            vim.g["codegpt_commands"] = {}
            vim.g["codegpt_commands"][key] = { model = "gpt-3.5-turbo" }
          end
        end
    },
    { -- vim-illuminate: Highlight other uses of word under cursor
        'RRethy/vim-illuminate',
    },
    { -- trouble.nvim: Improve diagnostics
        'folke/trouble.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },
})

-- Set colorscheme before anything else
vim.cmd [[colorscheme dim]]

require("nvim-web-devicons").setup({
    default = true,
})

require("lsp_configs")
require("uiux")
