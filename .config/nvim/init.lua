-- To install paq:
-- git clone --depth=1 https://github.com/savq/paq-nvim.git \ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

require "paq" {
	"savq/paq-nvim";
	"neovim/nvim-lspconfig";
	"hrsh7th/nvim-cmp";
	"hrsh7th/cmp-nvim-lsp";
    "L3MON4D3/LuaSnip";
    "saadparwaiz1/cmp_luasnip";
}

require "completion"
require "settings"
require "maps"

require "lsp.lua"


