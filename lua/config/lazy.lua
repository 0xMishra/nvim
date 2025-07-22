vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins using lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox-material" } },

	-- automatically check for plugin updates
	checker = { enabled = false },
	ui = {
		icons = {
			cmd = "", -- command
			config = "", -- config loaded
			event = "", -- event name
			ft = "", -- filetype
			init = "", -- init function
			keys = "", -- keymap
			plugin = "", -- plugin
			runtime = "", -- runtime path
			require = "", -- require
			source = "", -- source
			start = "", -- start plugin
			task = "", -- task
			lazy = "", -- lazy loaded
		},
	},
})
