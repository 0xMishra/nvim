return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			auto_install = true,
			ensure_installed = {
				"yaml",
				"toml",
				"bash",
				"json",
				"lua",
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
				"gosum",
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
	end,
}
