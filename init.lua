-- only if neovim >=0.9
-- To make neovim start faster
vim.cmd([[
  autocmd VimEnter * lua require'vim.loader'.enable()
]])

-- CONFIG
require("config.netrw")
require("config.options")
require("config.cmd")
require("config.packer")
require("config.keymaps")
require("config.autocmds")

-- PLUGINS
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.git-plugins")
require("plugins.lualine")
require("plugins.cmp")
require("plugins.comments")
require("plugins.null-ls")
require("plugins.lspconfig")
require("plugins.telescope")
require("plugins.trouble")
require("plugins.mini-pairs")
require("plugins.indent-blankline")
require("plugins.harpoon")
