require("neo-tree").setup({
    enable_diagnostics = false,
    enable_git_status = true,
    default_component_configs = {
        name = {
            trailing_slash = false,
            use_git_status_colors = false,
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
    window = {
        position = "left",
        width = "31",
    }
})

local ts_actions = require("telescope.actions")
require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = ts_actions.close
            },
        },
    }
}

require("gitsigns").setup()
require("symbols-outline").setup()
