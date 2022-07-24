vim.cmd [[
    if exists("&termguicolors") && exists("&winblend")
        syntax enable
        set termguicolors
        set winblend=0
        set wildoptions=pum
        set pumblend=5
        set background=dark
        colorscheme gruvbox
        highlight Normal guibg=None
        highlight NonText guibg=None
    endif
]]
