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
    commit = 'e1aca58',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'mfussenegger/nvim-dap',
  },
  { -- Outline: LSP-powered symbols bar
    'hedyhli/outline.nvim',
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
    'mason-org/mason.nvim',
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
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
  { -- vim-illuminate: Highlight other uses of word under cursor
    'RRethy/vim-illuminate',
  },
  { -- trouble.nvim: Improve diagnostics
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        override_vim_notify = true,
      }
    },
  },
  { -- filetype recognition for helm
    "qvalentin/helm-ls.nvim",
    ft = "helm"
  },
  -- AI Companion Setup
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "INFO", -- or "TRACE"
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  -- AI Companion Setup END^^
})

require("nvim-web-devicons").setup({
  default = true,
})

require("lsp_configs")
require("uiux")
require("ai")
