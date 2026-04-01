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
    "ty",
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
  automatic_enable = true,
})

vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
vim.keymap.set('n', '<C-space>', vim.diagnostic.open_float)

-- Configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
vim.lsp.config('yamlls', {
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
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
vim.lsp.config('jdtls', {
  handlers = {
    ["language/status"] = function() end,
    ["$/progress"] = function() end,
  }
})
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
      lineLength = 120,
      lint = {
        ignore = {
          "F821"
        }
      },
    }
  }
})

-- treesitter
require("nvim-treesitter").setup({
  ensure_installed = "all",
  auto_install = false,
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

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { underline = false })
