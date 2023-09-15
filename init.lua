-- only if neovim >=0.9
-- To make neovim start faster
vim.cmd([[
  autocmd VimEnter * lua require'vim.loader'.enable()
]])

require("config.netrw")
require("config.options")
require("config.cmd")
require("config.packer")
require("config.keymaps")
require("config.autocmds")

require("plugins.neo-tree")
require("plugins.treesitter")
require("plugins.git-plugins")
require("plugins.lualine")
require("plugins.cmp")
require("plugins.comments")
require("plugins.null-ls")
require("plugins.lspconfig")
require("plugins.telescope")
require("plugins.trouble")

require("mini.pairs").setup()

vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

require("indent_blankline").setup({
  char = "⏐",
  show_trailing_blankline_indent = false,
})

-- To make neovim transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
