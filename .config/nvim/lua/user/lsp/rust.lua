-- Installation
-- 1. Install rust-analyzer (method for this is fuzzy as of Oct '22)

-- Uses simrat39/rust-tools for a bunch of default configuration
-- I might change that in future.
-- Options available in the server config: https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc

-- Todo, clean all this up into a dry file
local function on_attach(_, buffer)
    local keymap_opts = { buffer = buffer }

    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)

    -- Set updatetime for CursorHold
    -- 300ms of no cursor movement to trigger CursorHold
    vim.opt.updatetime = 100

    -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
       vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
            vim.lsp.buf.format()
        end,
        -- TODO Add an autocommand group
    })
end


local opts = {
    tools = {
        inlay_hints = {
            auto = true,
        }
    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                checkOnSave = {
                    command = "clippy",
                },
                imports = {
                    granularity = {
                        enforce = true,
                        group = "module",
                    },
                    prefix = "self",
                },
                procMacro = {
                    enable = true,
                },
            }
        }
    }
}

require("rust-tools").setup(opts);
