local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local file_specific_group = augroup("FileSpecific", { clear = true })
local custom_fn_group = augroup("CustomFn", { clear = true })

-- Use internal formatting for bindings like gq.
autocmd("LspAttach", {
	group = custom_fn_group,
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})

autocmd("FileType", {
	group = file_specific_group,
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.tw = 72
		vim.opt_local.formatoptions = "crqanj" -- :help fo-table
	end,
})

-- TODO: set format options
autocmd("FileType", {
	group = file_specific_group,
	pattern = { "tex", "markdown" },
	callback = function()
		vim.opt_local.tw = 65
		vim.opt_local.sidescrolloff = 0
	end,
})

-- Trim whitespaces
autocmd("BufWritePre", {
	group = custom_fn_group,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

autocmd("BufWritePre", {
	group = custom_fn_group,
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})
