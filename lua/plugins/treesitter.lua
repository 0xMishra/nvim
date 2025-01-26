return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	priority = 1000,
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
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
