return {
	"sainnhe/gruvbox-material",
	priority = 1000,

	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.cmd.colorscheme("gruvbox-material")

		-- To make neovim transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
