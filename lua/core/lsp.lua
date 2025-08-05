-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview

-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.
vim.lsp.enable({
	"lua_ls",
	"gopls",
})

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			-- Show completion menu
			vim.keymap.set("i", "<C-e>", function()
				vim.lsp.completion.get() -- Show completion menu
			end, { buffer = ev.buf, desc = "Show completion" })

			-- Select next completion item
			vim.keymap.set("i", "<Tab>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-n>"
				else
					return "<Tab>"
				end
			end, { expr = true, buffer = ev.buf, desc = "Next completion" })

			-- Select previous completion item
			vim.keymap.set("i", "<S-Tab>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-p>"
				else
					return "<S-Tab>"
				end
			end, { expr = true, buffer = ev.buf, desc = "Prev completion" })

			-- Accept selection ("<CR>")
			vim.keymap.set("i", "<CR>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-y>"
				else
					return "<CR>"
				end
			end, { expr = true, buffer = ev.buf, desc = "Accept completion" })

			-- Cancel completion ("<C-c>")
			vim.keymap.set("i", "<C-c>", function()
				if vim.fn.pumvisible() == 1 then
					return "<C-e>"
				else
					return "<C-c>"
				end
			end, { expr = true, buffer = ev.buf, desc = "Cancel completion" })
		end

		-- Buffer local mappings.
		local opts = { buffer = ev.buf, silent = true }
		local keymap = vim.keymap

		opts.desc = "Go to definition"
		keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

		opts.desc = "Set diagnostics to quickfix list"
		keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		opts.desc = "format buffer"
		keymap.set("n", "<space>bf", function()
			vim.lsp.buf.format()
		end, { silent = true })
	end,
})

-- diagnostics configuration
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		},
	},
})

-- Lsp commands
local function restart_lsp(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	for _, client in ipairs(clients) do
		vim.lsp.stop_client(client.id)
	end

	vim.defer_fn(function()
		vim.cmd("edit")
	end, 100)
end

vim.api.nvim_create_user_command("LspRestart", function()
	restart_lsp()
end, {})

local function lsp_info()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	print("═══════════════════════════════════")
	print("           LSP INFORMATION          ")
	print("═══════════════════════════════════")
	print("")

	-- Basic info
	print(" Language client log: " .. vim.lsp.get_log_path())
	print(" Detected filetype: " .. vim.bo.filetype)

	print(" Buffer: " .. bufnr)
	print(" Root directory: " .. (vim.fn.getcwd() or "N/A"))
	print("")

	if #clients == 0 then
		print(" No LSP clients attached to buffer " .. bufnr)

		print("")

		print("Possible reasons:")
		print("   No language server installed for " .. vim.bo.filetype)
		print("   Language server not configured")
		print("   Not in a project root directory")
		print("   File type not recognized")

		return
	end

	print(" LSP clients attached to buffer " .. bufnr .. ":")
	print("─────────────────────────────────")

	for i, client in ipairs(clients) do
		print(string.format(" Client %d: %s", i, client.name))
		print("  ID: " .. client.id)
		print("  Root dir: " .. (client.config.root_dir or "Not set"))
		print("  Command: " .. table.concat(client.config.cmd or {}, " "))
		print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

		-- Server status

		if client.is_stopped() then
			print("  Status:  Stopped")
		else
			print("  Status:  Running")
		end

		-- Workspace folders
		if client.workspace_folders and #client.workspace_folders > 0 then
			print("  Workspace folders:")
			for _, folder in ipairs(client.workspace_folders) do
				print("     " .. folder.name)
			end
		end

		-- Attached buffers count
		local attached_buffers = {}
		for buf, _ in pairs(client.attached_buffers or {}) do
			table.insert(attached_buffers, buf)
		end

		print("  Attached buffers: " .. #attached_buffers)

		-- Key capabilities
		local caps = client.server_capabilities
		local key_features = {}
		if caps.completionProvider then
			table.insert(key_features, "completion")
		end
		if caps.hoverProvider then
			table.insert(key_features, "hover")
		end
		if caps.definitionProvider then
			table.insert(key_features, "definition")
		end
		if caps.documentFormattingProvider then
			table.insert(key_features, "formatting")
		end
		if caps.codeActionProvider then
			table.insert(key_features, "code_action")
		end

		if #key_features > 0 then
			print("  Key features: " .. table.concat(key_features, ", "))
		end

		print("")
	end

	-- Diagnostics summary
	local diagnostics = vim.diagnostic.get(bufnr)
	if #diagnostics > 0 then
		print(" Diagnostics Summary:")
		local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

		for _, diagnostic in ipairs(diagnostics) do
			local severity = vim.diagnostic.severity[diagnostic.severity]

			counts[severity] = counts[severity] + 1
		end

		print("   Errors: " .. counts.ERROR)
		print("   Warnings: " .. counts.WARN)
		print("   Info: " .. counts.INFO)
		print("   Hints: " .. counts.HINT)
		print("   Total: " .. #diagnostics)
	else
		print(" No diagnostics")
	end

	print("")
	print("Use :LspLog to view detailed logs")
	print("Use :LspCapabilities for full capability list")
end

-- Create command
vim.api.nvim_create_user_command("LspInfo", lsp_info, { desc = "Show comprehensive LSP information" })

local function stop_lsp(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	for _, client in ipairs(clients) do
		vim.lsp.stop_client(client.id)
	end
end

vim.api.nvim_create_user_command("LspStop", function()
	stop_lsp()
end, { desc = "Stop attached LSP clients" })

vim.keymap.set("n", "<leader>lsp", ":LspRestart<CR>", { desc = "Restart LSP server" })
