require("lualine").setup({
	options = {
		theme = "auto",
		icons_enabled = false,
		component_separators = "│",
		section_separators = "",
		disabled_filetypes = {
			statusline = {
				"help",
				"startify",
				"dashboard",
				"neo-tree",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"alpha",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
				"qf",
			},
			winbar = {},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = { "filetype", "progress" },
		lualine_y = {},
		lualine_z = {},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},
})
