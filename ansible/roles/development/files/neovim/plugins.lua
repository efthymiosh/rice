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
    },
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
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
        win = {
          keys = {
            nav_left      = { "<c-w>h", "nav_left"  , expr = false, desc = "navigate to the left window" },
            nav_down      = { "<c-w>j", "nav_down"  , expr = false, desc = "navigate to the below window" },
            nav_up        = { "<c-w>k", "nav_up"    , expr = false, desc = "navigate to the above window" },
            nav_right     = { "<c-w>l", "nav_right" , expr = false, desc = "navigate to the right window" },
            fullscreen    = { "<leader>ch", function(t) vim.api.nvim_win_set_width(t.win, vim.o.columns) end, mode = "nt", desc = "sidekick fullscreen" },
            restore_size  = { "<leader>cl", function(t) vim.api.nvim_win_set_width(t.win, 80) end, mode = "nt", desc = "sidekick restore size" },
          }
        }
      },
    },
    keys = {
      {
        "<S-Tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<S-Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>ca",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>cs",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>cd",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>ct",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>cf",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>cv",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>cp",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>cc",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
    },
  }
})

require("nvim-web-devicons").setup({
  default = true,
})

require("lsp_configs")
require("uiux")
