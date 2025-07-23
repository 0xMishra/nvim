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
				Text = "tx",
				Method = "fn",

				Function = "fn",

				Constructor = "Co",

				Field = "fi",
				Variable = "va",
				Property = "pr",

				Class = "cl",
				Interface = "if",
				Struct = "st",
				Module = "{}",

				Unit = "Un",
				Value = "vl",
				Enum = "en",

				EnumMember = "em",

				Keyword = "kw",
				Constant = "##",

				Snippet = "sn",
				Color = "co",
				File = "fl",
				Reference = "rf",
				Folder = "di",
				Event = "ev",
				Operator = "op",
				TypeParameter = "tp",
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
