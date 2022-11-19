-- To install paq:
-- git clone --depth=1 https://github.com/savq/paq-nvim.git \ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

vim.cmd [[ 
    augroup paq_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PaqSync
    augroup end
]]

local paq_ok, paq = pcall(require, "paq")
if not paq_ok then
    vim.notify("Paq failed to load")
    return
end

paq {
    "savq/paq-nvim";
    "nvim-lua/plenary.nvim";
    "neovim/nvim-lspconfig";
    "williamboman/nvim-lsp-installer";
    "simrat39/rust-tools.nvim";
    "windwp/nvim-autopairs";
    "nvim-tree/nvim-tree.lua";
    "nvim-tree/nvim-web-devicons";

    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-path";
    "hrsh7th/cmp-nvim-lsp";
    "Saecki/crates.nvim";

    "saadparwaiz1/cmp_luasnip";
    "L3MON4D3/LuaSnip";
    "rafamadriz/friendly-snippets";

    "nvim-telescope/telescope.nvim";
    "nvim-treesitter/nvim-treesitter";
}

