local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local file_specific_group = augroup("FileSpecific", {})
local custom_fn_group = augroup("CustomFn", {})

autocmd("FileType", {
  group = file_specific_group,
  pattern = "python",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})

autocmd("FileType", {
  group = file_specific_group,
  pattern = { "tex", "markdown" },
  callback = function()
    vim.opt.tw = 67
  end,
})

-- Trim whitespaces
autocmd("BufWritePre", {
    group = custom_fn_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
