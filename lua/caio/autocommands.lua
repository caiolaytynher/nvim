vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "python",
    callback = function()
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
    end,
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = { "tex", "markdown" },
    callback = function()
      vim.opt.tw = 67
    end,
  }
)
