require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },

		python = { "isort", "black" },

		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		yaml = { { "prettierd", "prettier" } },

		-- for reactjs files formatting
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		async = false,
		lsp_fallback = true,
	},
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
