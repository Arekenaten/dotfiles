local map = vim.keymap.set
local M = {}
local options = { slient = true }
--lsp
--e

-- Leader
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- jk exit insert
map('i', 'jk', '<esc>', {})

-- Editor shortcuts
map('i', '(', '()<left>', {})
map('i', '[', '[]<left>', {})
map('i', '{', '{}<left>', {})
map('i', '{<CR>', '{<CR>}<ESC>O', {})
map('i', '{;<CR>', '{<CR>};<ESC>O', {})

vim.api.nvim_exec([[
    inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
    inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
    inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
    inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : '""<left>'
    inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
]], false)

-- Clear highlights
map('n', '<leader><cr>', ':nohlsearch<cr>', {silent=true})

function M.on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
  buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', options)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)

  if client.server_capabilities.document_formatting then
    buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap('n', 'ff', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', options)
  end
end

-- final return
return M
