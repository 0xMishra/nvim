return {
	"echasnovski/mini.comment",
	version = false,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },

	config = function()
		vim.g.skip_ts_context_commentstring_module = true

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
			languages = {
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
				typescript = { __default = "// %s", __multiline = "/* %s */" },
			},
		})

		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		})
	end,
}
