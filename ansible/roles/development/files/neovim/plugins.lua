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
  { -- blink autocompletion
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
      keymap = {
        preset = 'default',
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = {
          auto_show = false,
        },
        documentation = {
          auto_show = false,
          window = {
            border = 'single',
          },
        },
      },
      signature = {
        enabled = true,
        trigger = {
          enabled = false,
        },
        window = {
          border = 'single',
          show_documentation = true,
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
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
  }
})

require("nvim-web-devicons").setup({
  default = true,
})

require("lsp_configs")
require("uiux")
