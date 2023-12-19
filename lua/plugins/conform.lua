local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		svelte = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		graphql = { "prettierd" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},

	format_on_save = {
		lsp_fallback = true,
		async = true,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = true,
	})
end, { desc = "Format file or range (in visual mode)" })
