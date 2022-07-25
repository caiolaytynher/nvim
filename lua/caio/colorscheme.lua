local colorscheme = "gruvbox"

vim.opt.termguicolors = true -- TODO: find a way to check if exists
vim.opt.background = "dark"

-- Check if colorscheme exists
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.cmd([[colorscheme default]])
  return
end

local bg_transparency = true
if not bg_transparency then return end

-- Remove background to allow transparency
local highlight_groups = { "Normal", "SignColumn", "CursorLineNR" }

for _, group in pairs(highlight_groups) do
  vim.api.nvim_set_hl(0, group, {
    bg = "none"
  })
end
