local lspconfig = require('lspconfig')
lspconfig.yamlls.setup({
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            }
        }
    }
})
