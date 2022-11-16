-- Install (mac) sudo port install lua-language-server

require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
                globals = {"vim"}
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
