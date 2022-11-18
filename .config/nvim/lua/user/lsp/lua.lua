-- Install 
-- (mac) sudo port install lua-language-server
-- (linux) 
-- 1. Install Ninja
-- sudo apt-get install ninja-build
-- 2. Install gcc and g++
-- sudo apt-get install gcc
-- sudo apt-get install g++
-- 3. Build the language server
--[[
    mkdir -p $HOME/tools/ && cd $HOME/tools
    git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server

    cd lua-language-server
    git submodule update --init --recursive

    cd 3rd/luamake
    compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
--]]
-- 4. Add language server to path
-- export PATH="$HOME/tools/lua-language-server/bin/:$PATH"

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
