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
require("plugins.comments")
require("plugins.lspconfig")
require("plugins.git-plugins")
require("plugins.telescope")
require("plugins.trouble")
require("plugins.harpoon")
require("plugins.indent-blankline")
require("plugins.mini-pairs")
require("plugins.null-ls")
