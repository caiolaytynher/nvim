-- The setup was based of LunarVim
-- https://github.com/LunarVim/Neovim-from-scratch

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true }),
	pattern = "plugins.lua",
	callback = function()
		vim.cmd([[source <afile> | PackerSync]]) -- TODO: rewrite this in lua
	end,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("hoob3rt/lualine.nvim")
	use("nvim-telescope/telescope.nvim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("lewis6991/gitsigns.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("p00f/nvim-ts-rainbow") -- bracket pair colorizer

	-- Completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = "<cmd>TSUpdate" })

	-- Color schemes
	use("gruvbox-community/gruvbox")
	use({ "dracula/vim", as = "dracula" })
	use("lunarvim/darkplus.nvim") -- TODO
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("savq/melange") -- TODO: give it a chance
	use("navarasu/onedark.nvim")
	use("sainnhe/everforest")
	use("rebelot/kanagawa.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
