local signs = { Error = "✘", Warn = "❢", Hint = "", Info = "ℹ" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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

-- neoscroll
require("neoscroll").setup({
  hide_cursor = true,            -- Hide cursor while scrolling
  stop_eof = true,               -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = true,     -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true,   -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = "quadratic", -- Default easing function
  pre_hook = nil,                -- Function to run before the scrolling animation starts
  post_hook = nil,               -- Function to run after the scrolling animation ends
  performance_mode = false,      -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '150'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '150'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '150'}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
t['zt']    = {'zt', {'150'}}
t['zz']    = {'zz', {'150'}}
t['zb']    = {'zb', {'150'}}

require('neoscroll.config').set_mappings(t)
