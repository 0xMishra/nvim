-- open root directory and file tree of the project
function OpenCurrentDirectory()
	local current_directory = vim.fn.getcwd()
	vim.cmd("e " .. current_directory)
end

vim.api.nvim_set_keymap("n", "~", ":lua OpenCurrentDirectory()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>lsp", ":LspRestart<CR>", { desc = "Next buffer" })

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
vim.keymap.set("n", "<space>rr", ":%s/\\r//g<CR>", { silent = true })

-- NETRW CONFIG
vim.keymap.set("n", "<space>f", ":Explore<CR>", { silent = true })

-- Open Git
vim.keymap.set("n", "<space>g", ":G<CR>", { silent = true })

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

-- hide statusline
vim.cmd(":hi statusline guibg=NONE")
