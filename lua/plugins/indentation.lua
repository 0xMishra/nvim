return {
	"lukas-reineke/indent-blankline.nvim",

	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = true },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
					"PlenaryTestPopup",
					"lspinfo",
					"fugitive",
					"git",
					"man",
					"qf",
					"spectre_panel",
					"startuptime",
					"tsplayground",
					"neotest-output",
					"checkhealth",
					"neotest-summary",
					"neotest-output-panel",
				},
			},
		})
	end,
}
