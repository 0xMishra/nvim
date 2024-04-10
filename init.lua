-- for installing tailwindcss server via coc.nvim
-- run :InstallCocTailwindCSS3 after initializing neovim
vim.loader.enable()

require("config.packer")
require("config.netrw")
require("config.options")
require("config.cmd")
require("config.keymaps")
require("config.autocmds")

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.comment")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.indent")
require("plugins.git")
require("plugins.format")
require("plugins.harpoon")
