local o = vim.opt
local cmd = vim.cmd

-- Ui
cmd "syntax enable"
cmd "colorscheme onedark"
o.cursorline = true
o.expandtab = true
o.foldmethod = "syntax"
o.foldnestmax = 2
o.foldlevelstart = 1
o.hidden = true
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.shiftwidth = 4
o.softtabstop = 4
o.splitright = true
o.splitbelow = true
o.signcolumn = "yes"
o.tabstop = 4
o.wrap = false
o.completeopt="menuone,noinsert,noselect"

-- General
o.ignorecase = true
o.smartcase = true
