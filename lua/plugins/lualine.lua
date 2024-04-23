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
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_b = {},
		lualine_c = { "branch", "diagnostics", {
			"filename",
			path = 1,
		} },
		lualine_x = { "diff", "filetype" },
		lualine_y = {},
		lualine_z = {
			{
				"progress",
				fmt = function(str)
					-- Remove percentage signs from the string
					str = str:gsub("%%", "")
					-- Check if the modified string is a number from 1 to 9
					if tonumber(str) and tonumber(str) >= 1 and tonumber(str) <= 9 then
						return "0"
					else
						return str:sub(1, 1)
					end
				end,
			},
		},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "filetype", "location" },
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},
})
