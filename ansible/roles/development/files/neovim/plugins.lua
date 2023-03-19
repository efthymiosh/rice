require("neo-tree").setup({
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
