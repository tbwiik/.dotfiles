require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "tsc", "pyright", "marksman", "yamlls"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
