local signs = {
  Error = "✘",
  Warn = "󱈸",
  Hint = "󰌶",
  Info = ""
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  virtual_text = true,
  underline = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    }
  }
})

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
      folder_empty = "",
      folder_empty_open = "",
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
    },
    group_empty_dirs = true,
    scan_mode = "deep",
    async_directory_scan = "auto",
  },
  window = {
    position = "left",
    width = "31",
  },
  buffers = {
    follow_current_file = {
      enabled = true
    }
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

require("outline").setup({
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
