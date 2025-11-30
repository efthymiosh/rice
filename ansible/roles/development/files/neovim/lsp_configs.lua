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
  automatic_enable = true,
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
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
vim.lsp.config('basedpyright', {
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
vim.lsp.config('jdtls', {
  handlers = {
    ["language/status"] = function() end,
    ["$/progress"] = function() end,
  }
})
local ruff_on_attach = function(client, bufnr)
  -- Disable hover in favor of basedpyright
  client.server_capabilities.hoverProvider = false
end
vim.lsp.config('ruff', {
  on_attach = ruff_on_attach,
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",

      lineLength = 120,
    }
  }
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

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
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
