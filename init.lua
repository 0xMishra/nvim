-- only if neovim >=0.9
-- To make neovim start faster
vim.loader.enable()

-- CONFIG
require("config.packer")
require("config.netrw")
require("config.options")
require("config.cmd")
require("config.keymaps")
require("config.autocmds")

-- PLUGINS
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.git-plugins")
require("plugins.cmp")
require("plugins.comments")
require("plugins.lspconfig")
require("plugins.telescope")
require("plugins.trouble")
require("plugins.harpoon")
require("plugins.indent-blankline")
require("plugins.mini-pairs")
require("plugins.null-ls")
