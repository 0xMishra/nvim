-- mason null ls for automatically installing formatters and linters
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")

mason_null_ls.setup({
	automatic_installation = true,
	ensure_installed = {
		"prettierd", -- prettier formatter
		"stylua", -- lua formatter
		"eslint_d", -- js linter
	},
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
	sources = {
		formatting.stylua,
		formatting.prettierd,
		-- diagnostics.eslint_d,
		diagnostics.eslint_d.with({ -- js/ts linter
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.mjs" }) -- only enable if root has any of these config files
			end,
		}),
		code_actions.gitsigns,
	},

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
