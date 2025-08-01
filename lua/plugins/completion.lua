return {
	"saghen/blink.cmp",
	event = "InsertEnter",

	version = "1.*",
	opts = {
		keymap = {
			["<C-e>"] = { "show", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-c>"] = { "cancel", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "t",
				Method = "F",

				Function = "F",

				Constructor = "X",

				Field = "f",
				Variable = "V",
				Property = "$",

				Class = "C",
				Interface = "I",
				Struct = "S",
				Module = "M",

				Unit = "u",
				Value = "v",
				Enum = "E",

				EnumMember = "n",

				Keyword = "K",
				Constant = "#",

				Snippet = "s",
				Color = "c",
				File = "-",
				Reference = "r",
				Folder = "d",
				Event = "e",
				Operator = "O",
				TypeParameter = "G",
			},
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 10, window = { border = "single" } },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
