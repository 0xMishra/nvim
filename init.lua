-- only if neovim >=0.9
-- To make neovim start faster
vim.cmd([[
  autocmd VimEnter * lua require'vim.loader'.enable()
]])

require("lua.config.netrw")
require("lua.config.options")
require("lua.config.cmd")

require("lua.config.packer")

require("lua.plugins.cmp")
require("lua.plugins.comments")
require("lua.plugins.git-plugins")
require("mini.pairs").setup()
require("lua.plugins.null-ls")
require("lua.plugins.lspconfig")
require("lua.plugins.treesitter")
require("lua.plugins.lualine")
require("lua.plugins.tailwindcss")
require("lua.plugins.telescope")
require("lua.plugins.trouble")
require("lua.config.keymaps")
require("lua.config.autocmds")

vim.g.gruvbox_material_background = "hard"
vim.cmd.colorscheme("gruvbox-material")

require("indent_blankline").setup({
  char = "⏐",
  show_trailing_blankline_indent = false,
})

-- To make neovim transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
