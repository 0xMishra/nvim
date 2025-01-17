require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = { __default = "// %s", __multiline = "/* %s */" },
		},
	},
	auto_install = true,
	ensure_installed = {
		"css",
		"html",
		"javascript",
		"yaml",
		"toml",
		"bash",
		"json",
		"jsonc",
		"lua",
		"tsx",
		"typescript",
		"prisma",
		"markdown",
		"vim",
		"vimdoc",
		"gitignore",
		"gitcommit",
		"diff",
		"sql",
		"dockerfile",
		"xml",
		"tmux",
		"make",
		"go",
		"gomod",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>vv",
			node_incremental = "+",
			scope_incremental = false,
			node_decremental = "_",
		},
	},
})
