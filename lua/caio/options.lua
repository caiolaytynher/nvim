local options = {
  exrc = true,
  encoding = "utf-8",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  ai = true,
  si = true,
  relativenumber = true,
  nu = true,
  hlsearch = false,
  hidden = true,
  errorbells = false,
  wrap = false,
  ignorecase = true,
  smartcase = true,
  swapfile = false,
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  incsearch = true,
  scrolloff = 10,
  signcolumn = "no",
  cursorline = true,
  mouse = "a",
  showmode = false,
  clipboard = "unnamedplus",
  splitbelow = true,
  splitright = true,
  signcolumn = "yes",
  -- updatetime = 300,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
