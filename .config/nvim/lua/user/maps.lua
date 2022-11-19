local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
map('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- jk exit insert
map('i', 'jk', '<esc>', opts)

-- Editor shortcuts
map('i', '(', '()<left>', opts)
map('i', '[', '[]<left>', opts)
map('i', '{', '{}<left>', opts)
map('i', '{<CR>', '{<CR>}<ESC>O', opts)
map('i', '{;<CR>', '{<CR>};<ESC>O', opts)

vim.api.nvim_exec([[
    inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
    inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
    inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
    inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : '""<left>'
    inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
]], false)

-- Clear highlights
map('n', '<leader><cr>', ':nohlsearch<cr>', opts)

-- Language Server
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- Lexplore
map('n', '<leader>e', ':Lex 40<cr>', opts);
