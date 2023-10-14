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
require("config.autoformat")
require("config.autopairs")

-- PLUGINS
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.git-plugins")
require("plugins.lualine")
require("plugins.cmp")
require("plugins.comments")
require("plugins.lspconfig")
require("plugins.telescope")
require("plugins.trouble")
require("plugins.harpoon")
require("plugins.indent-blankline")
