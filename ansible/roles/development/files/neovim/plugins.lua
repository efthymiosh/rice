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
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
    },
    { -- CodeGPT: Code-oriented ChatGPT (req api key set as OPENAI_API_KEY)
        'dpayne/CodeGPT.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        }
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "bashls",
        "clangd",
        "cssls",
        "dockerls",
        "gopls",
        "gradle_ls",
        "groovyls",
        "jdtls",
        "jsonls",
        "tsserver",
        "julials",
        "kotlin_language_server",
        "lua_ls",
        "marksman",
        "rnix",
        "pyright",
        "rust_analyzer",
        "taplo",
        "terraformls",
        "yamlls",
    },
    automatic_installation = true,
})

require("nvim-web-devicons").setup({
    default = true,
})

-- LSP
local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
local opts = {buffer = bufnr}
  lsp.default_keymaps(opts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, opts)
end)

cmp.setup({
  sources = cmp.config.sources({
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
  }),
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  completion = {
      autocomplete = false,
  },
})
lsp.setup()

local signs = { Error = "✘", Warn = "❢", Hint = "", Info = "ℹ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("lsp_configs")

require("neo-tree").setup({
    enable_diagnostics = false,
    enable_git_status = true,
    default_component_configs = {
        name = {
            trailing_slash = false,
            use_git_status_colors = false,
        },
        icon = {
            folder_empty = "🗀"
        },
        git_status = {
            symbols = {
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
    },
    filesystem = {
        use_libuv_file_watcher = true,
    },
    window = {
        position = "left",
        width = "31",
    },
    buffers = {
        follow_current_file = true
    }
})

local ts_actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = ts_actions.close
            },
        },
    }
})

require("gitsigns").setup({
    signs = {
        untracked = { text = '│' },
    }
})

require("symbols-outline").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",

  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,
    disable = {
        "yaml",
    },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
