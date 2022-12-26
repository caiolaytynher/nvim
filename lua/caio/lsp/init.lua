local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
require("caio.lsp.configs")
require("caio.lsp.handlers").setup()
require("caio.lsp.null-ls")
