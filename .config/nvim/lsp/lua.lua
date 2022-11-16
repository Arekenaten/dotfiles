-- Install (mac) sudo port install lua-language-server

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    cmd = {"/opt/local/bin/lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

