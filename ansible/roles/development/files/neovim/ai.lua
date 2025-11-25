require("codecompanion").setup({
  adapters = {
    acp = {
      gemini_cli = function()
        return require("codecompanion.adapters").extend("gemini_cli", {
          defaults = {
            auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
          },
          env = {
            api_key = "GEMINI_API_KEY",
          },
        })
      end,
    },
  },
})
