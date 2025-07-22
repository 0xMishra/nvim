return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
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
