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

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = {
      "terraform",
  },

  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
