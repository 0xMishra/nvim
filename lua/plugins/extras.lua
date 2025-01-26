return {
	{
		"neoclide/coc.nvim",
		branch = "release",
		event = "InsertEnter",
		config = function()
			-- for installing tailwindcss server via coc.nvim
			vim.cmd("command! InstallTailwindCSS :CocInstall @yaegassy/coc-tailwindcss3")

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
			vim.keymap.set("n", "<leader>coc", ":CocRestart<CR>")
		end,
	},

	"christoomey/vim-tmux-navigator",
}
