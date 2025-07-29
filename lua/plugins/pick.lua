return {
	"echasnovski/mini.pick",
	version = "*",
	event = "VeryLazy",

	config = function()
		local pick = require("mini.pick")

		pick.setup({
			window = {
				border = "shadow",
				config = nil,
				prompt_caret = "_ ",
				prompt_prefix = "> ",
			},
			mappings = {
				-- save to quickfixlist
				choose_marked = "<C-q>",
			},
		})

		-- Set keymaps
		vim.keymap.set("n", "<leader>sf", function()
			pick.builtin.files()
		end, { desc = "Find files" })

		vim.keymap.set("n", "<leader>sg", function()
			pick.builtin.grep_live()
		end, { desc = "grep string" })
	end,
}
