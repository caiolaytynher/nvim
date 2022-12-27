local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local colorscheme = vim.g.colors_name
local bracket_colors = {
	kanagawa = {
		"#7AA89F",
		"#98BB6C",
		"#E6C384",
		"#D27E99",
		"#FF5D62",
		"#FFA066",
		"#717C7C",
	},
	melange = {
		"#99D59D",
		"#EBC06D",
		"#9AACCE",
		"#CE9BCB",
		"#88B3B2",
		"#C1A78E",
		"#B65C60",
	},
	darkplus = {
		"#D16969",
		"#569CD6",
		"#4EC9B0",
		"#CE9178",
		"#DCDCAA",
		"#C586C0",
		"#D16D9E",
	},
}

configs.setup({
	ensure_installed = "all",
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	additional_vim_regex_highlighting = false,
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = bracket_colors[colorscheme],
	},
})
