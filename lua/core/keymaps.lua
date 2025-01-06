-- open root directory and file tree of the project
function OpenCurrentDirectory()
	local current_directory = vim.fn.getcwd()
	vim.cmd("e " .. current_directory)
end

vim.api.nvim_set_keymap("n", "~", ":lua OpenCurrentDirectory()<CR>", { noremap = true, silent = true })

-- keymap to clear all the buffers
vim.keymap.set("n", "<Del>", ":bufdo bd | Explore<CR>", { noremap = true, silent = true })

-- keymap for not loosing a yanked word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- to remove the highlight over searched text
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope keymaps
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 0,

		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>se", require("telescope.builtin").git_files, { desc = "[S]earch Git Fil[E]s" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch by [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- AutoIndent a buffer with no LSP installed
vim.api.nvim_create_user_command("AutoIndent", function()
	vim.cmd("normal gg=G")
	vim.cmd("update")
end, {})

vim.keymap.set("n", "<Leader>ai", ":AutoIndent<CR>", { silent = true })

-- BUFFER KEYMAPS
vim.keymap.set("n", "<S-w>", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<space>bd", ":bdelete", { silent = false })

-- Remove carriage return character
vim.keymap.set("n", "<space>r", ":%s/\\r//g<CR>", { silent = true })

-- NETRW CONFIG
vim.keymap.set("n", "<space>f", ":Explore<CR>", { silent = true })

-- Open vim fugitive
vim.keymap.set("n", "<space>g", ":G<CR>", { silent = true })

-- Shortcut for opening this config file
vim.keymap.set("n", "<space>sk", ":Telescope keymaps<CR>", { silent = true })
vim.keymap.set("n", "<space>M", ":Mason<CR>", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Escaping the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Autocommands for terminal settings
vim.api.nvim_create_autocmd("TermEnter", {
	pattern = "*",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- Open terminal in insert mode by default
vim.api.nvim_create_augroup("InsertOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
	group = "InsertOnEnter",
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd("startinsert")
		end
	end,
})

-- Disable line numbers in terminal buffers
vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	group = "TerminalSettings",
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- Scroll to bottom in terminal on entering
vim.api.nvim_create_autocmd("TermEnter", {
	pattern = "*",
	callback = function()
		vim.fn.winrestview({ topline = vim.fn.line("$") })
	end,
})

-- Formatting a buffer
vim.keymap.set("n", "<space>bf", function()
	vim.lsp.buf.format()
end, { silent = true })

-- Coc keymaps
-- Use K to show documentation in preview window for coc.nvim plugin
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")

	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	elseif vim.api.nvim_eval("coc#rpc#ready()") then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end

vim.keymap.set("n", "<S-s>", "<CMD>lua _G.show_docs()<CR>", { silent = true })
