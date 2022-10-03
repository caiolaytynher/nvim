local options = {
	exrc = true, -- Be able to have local config files
	encoding = "utf-8",
	tabstop = 2, -- Number of spaces that a tab counts for
	softtabstop = 2, -- Size of a mix of tabs and spaces
	shiftwidth = 2, -- Size of tab placed in normal mode
	expandtab = true, -- Convert tabs to spaces
	ai = true, -- Auto indent
	si = true, -- Smart indent
	nu = true, -- Numbers
	relativenumber = true,
	signcolumn = "yes", -- Little column at the left of numbers
	hlsearch = false, -- Deactivate highlight search results after press enter
	ignorecase = true, -- Ignore case on search
	smartcase = true, -- If search contains upper case letters, not ignore case
	incsearch = true, -- Show while you search the matches
	hidden = true, -- Just hide the buffer instead of closing it
	errorbells = false, -- Disable annoying sounds
	wrap = false,
	swapfile = false,
	backup = false,
	undofile = true, -- Have a file that stores your undos
	undodir = os.getenv("HOME") .. "/.vim/undodir", -- Where to store the undos
	scrolloff = 10,
	sidescrolloff = 8,
	cursorline = true,
	mouse = "a", -- Use mouse in all modes
	showmode = false, -- I use lualine for show mode
	clipboard = "unnamedplus", -- Yanks work outside of neovim
	splitbelow = true,
	splitright = true,
	-- updatetime = 300,
	ls = 0,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
