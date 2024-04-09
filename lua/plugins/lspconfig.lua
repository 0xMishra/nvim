local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- Add border to floating window
vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silent = true })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silend = true })

-- Make float window transparent start
local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, "NormalFloat", {
		link = "Normal",
	})
	vim.api.nvim_set_hl(0, "FloatBorder", {
		bg = "none",
	})
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = set_hl_for_floating_window,
})

-- Make float window transparent end
local on_attach = function(client, bufnr)
	vim.keymap.set(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ buffer = bufnr, desc = "Show documentation for what is under cursor" }
	)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
	vim.keymap.set(
		{ "n", "v" },
		"gf",
		vim.lsp.buf.code_action,

		{ buffer = bufnr, desc = "See available code actions" }
	)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics for line" })
	vim.keymap.set(
		"n",
		"gr",
		"<cmd>Telescope lsp_references<CR>",
		{ buffer = bufnr, desc = "Show definition, references" }
	)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}

	vim.lsp.buf.execute_command(params)
end

-- configure typescript server with plugin
lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
	root_dir = util.root_pattern(".git"),
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"html",
		"cssls",
		"emmet_ls",
		"prismals",
		"jsonls",
	},
	automatic_installation = true,
})

mason_tool_installer.setup({
	ensure_installed = {
		"stylua",
		"eslint_d",
		"prettierd",
	},
})

vim.cmd([[
  nnoremap <silent> <space>oi :OrganizeImports<CR>
]])

-- for installing tailwindcss server via coc.nvim
vim.cmd("command! InstallCocTailwindCSS3 :CocInstall @yaegassy/coc-tailwindcss3")
