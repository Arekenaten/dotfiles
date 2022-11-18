-- Installation
-- 1. Install rust-analyzer (method for this is fuzzy as of Oct '22)

require'lspconfig'.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            }
        }
    }
}
