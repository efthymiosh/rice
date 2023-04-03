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

local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
local opts = {buffer = bufnr}
  lsp.default_keymaps(opts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<C-space>', vim.diagnostic.open_float, opts)
end)

cmp.setup({
    window = {
    --  completion = cmp.config.window.bordered(),
    --  documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        {name = 'path'},
        {name = 'nvim_lsp'},
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
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    completion = {
        autocomplete = false,
    },
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    }
})
lsp.setup()

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
                globals = {'vim'}
            }
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

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { underline = false })
