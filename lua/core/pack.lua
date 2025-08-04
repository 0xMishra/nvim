local base_url = "https://github.com/"

local repo_names = {
	"sainnhe/gruvbox-material",
	"stevearc/conform.nvim",
	"lewis6991/gitsigns.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"williamboman/mason.nvim",
	"echasnovski/mini.pick",
	"saghen/blink.cmp",
}

local plugins = {}

for i, repo in ipairs(repo_names) do
	plugins[i] = base_url .. repo
end

vim.pack.add(plugins)
