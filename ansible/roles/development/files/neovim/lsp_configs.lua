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
    "basedpyright",
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "gopls",
    "helm_ls",
    "jdtls",
    "jsonls",
    "julials",
    "kotlin_language_server",
    "lua_ls",
    "marksman",
    "phpactor",
    "rnix",
    "ruff",
    "rust_analyzer",
    "taplo",
    "terraformls",
    "ts_ls",
    "yamlls",
  },
  automatic_installation = true,
  automatic_setup = false,
  automatic_enable = false,
})

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  manage_nvim_cmp = false,
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  lsp.default_keymaps(opts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, opts)
  vim.keymap.set('n', '<C-space>', vim.diagnostic.open_float, opts)
end)

-- Configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require('lspconfig')
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      keyOrdering = false,
    }
  }
})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
lspconfig.basedpyright.setup({
  settings = {
    -- some of these defaults are completely replaced by any project-level configuration
    basedpyright = {
      analysis = {
        -- ["off", "basic", "standard", "strict", "all"]
        typeCheckingMode = "standard",
      },
      disableOrganizeImports = true,
    },
    python = {
      pythonPath = ".venv/bin/python"
    }
  }
})
lspconfig.jdtls.setup({
  handlers = {
    ["language/status"] = function() end,
    ["$/progress"] = function() end,
  }
})
local ruff_on_attach = function(client, bufnr)
  -- Disable hover in favor of basedpyright
  client.server_capabilities.hoverProvider = false
end
lspconfig.ruff.setup({
  on_attach = ruff_on_attach,
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",

      lineLength = 120,
    }
  }
})

lsp.setup()

local cmp = require('cmp')
local select_opts = { behavior = cmp.SelectBehavior.Insert }
cmp.setup({
  window = {
    --  completion = cmp.config.window.bordered(),
    --  documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    {
      name = 'buffer',
      keyword_length = 3,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  }),
  mapping = cmp.config.mapping({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
  }),
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = require('lspkind').cmp_format({

      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters
      ellipsis_char = '…', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      before = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'λ',
          luasnip = '⋗',
          buffer = 'Ω',
          path = '',
          nvim_lua = 'Π',
        }
        item.menu = menu_icon[entry.source.name]
        return item
      end,
    })
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
})

-- treesitter
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
  indent = {
    enable = true,
    disable = {
      "yaml",
    },
  }
})
require("illuminate").configure({
  providers = {
    "lsp",
    "treesitter",
  },
  under_cursor = false,
  delay = 100,
  min_count_to_highlight = 1,
})
require("trouble").setup({
  open_no_results = true,
  warn_no_results = false,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { underline = false })
