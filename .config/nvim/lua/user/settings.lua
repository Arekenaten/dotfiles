local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Disable netrw so nvimtree can work
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Ui
cmd "syntax enable"
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
o.shortmess = o.shortmess + "c"

-- General
o.ignorecase = true
o.smartcase = true
