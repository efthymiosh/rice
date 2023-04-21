local signs = { Error = "✘", Warn = "❢", Hint = "", Info = "ℹ" }
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

require("incline").setup()
require("symbols-outline").setup()

vim.g.linefly_options = {
  separator_symbol = "",
  progress_symbol = "↓",
  active_tab_symbol = "▪",
  git_branch_symbol = "",
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
