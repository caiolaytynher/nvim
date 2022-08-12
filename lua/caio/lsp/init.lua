local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("caio.lsp.configs")
require("caio.lsp.handlers").setup()
require("caio.lsp.null-ls")
