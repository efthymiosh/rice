local signs = { Error = "✘", Warn = "", Hint = "󰌶", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end

require("neo-tree").setup({
    enable_diagnostics = false,
    enable_git_status = true,
    default_component_configs = {
        name = {
            trailing_slash = false,
            use_git_status_colors = false,
        },
        icon = {
            folder_empty = ""
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
        filtered_items = {
          hide_gitignored = false,
        }
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

require("symbols-outline").setup({
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "󰆧", hl = "@namespace" },
    Namespace = { icon = "󰅪", hl = "@namespace" },
    Package = { icon = "󰏗", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "󰆨", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "󰜰", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "󰅪", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    Event = { icon = "", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "󰅴", hl = "@function" },
    Fragment = { icon = "󰅴", hl = "@constant" },
  },
})

vim.g.linefly_options = {
  separator_symbol = "",
  progress_symbol = "↓",
  active_tab_symbol = "▪",
  git_branch_symbol = "",
  ellipsis_symbol = '…',
  error_symbol = signs.Error,
  warning_symbol = signs.Warn,
  information_symbol = signs.Info,
  tabline = false,
  winbar = false,
  with_file_icon = false,
  with_git_branch = true,
  with_git_status = false,
  with_diagnostic_status = true,
  with_session_status = false,
  with_indent_status = false,
}
