require("fzf-lua").setup({
	colorscheme = "gruvbox-material",
	winopts = {
		fullscreen = false,
		preview = {
			layout = "horizontal",
			horizontal = "right:50%", -- up|down:size
		},
	},
	fzf_opts = {
		["--keep-right"] = "", -- https://github.com/ibhagwan/fzf-lua/issues/269
		["--layout"] = "reverse-list",
		-- ["--ansi"] = false,
	},
	keymap = {
		fzf = {
			["ctrl-q"] = "select-all+accept", -- https://github.com/ibhagwan/fzf-lua/issues/324
		},
	},
	files = {
		git_icons = false,
		file_icons = false,
	},
})

vim.keymap.set("n", "<leader>sf", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

vim.keymap.set(
	"n",
	"<leader><space>",
	"<cmd>lua require('fzf-lua').buffers()<CR>",
	{ desc = "Fuzzy find recent files" }
)

vim.keymap.set("n", "<leader>sg", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", { desc = "Find string in cwd" })

vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")
vim.keymap.set("n", "<leader>sd", ":FzfLua diagnostics_workspace<CR>")
vim.keymap.set("n", "<leader>/", ":FzfLua blines <CR>")
