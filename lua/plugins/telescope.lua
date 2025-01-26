return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local telescope = require("telescope")
		telescope.setup({
			file_ignore_patterns = { "%.git/." },
			defaults = {
				previewer = false,
				disable_devicons = true,
				-- hidden = true,
				prompt_prefix = "   ",
				file_ignore_patterns = { "node_modules", "package-lock.json" },
				initial_mode = "insert",
				select_strategy = "reset",
				sorting_strategy = "ascending",
				-- layout_strategy = "horizontal",
				layout_config = {
					--   width = 0.5,
					--   height = 0.4,
					prompt_position = "top",
					preview_cutoff = 120,
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					disable_devicons = true,
					layout_config = {
						width = 0.5,
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},

				git_files = {
					previewer = false,
					disable_devicons = true,
					theme = "dropdown",
					layout_config = {
						width = 0.5,
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},

				buffers = {
					previewer = false,
					disable_devicons = true,
					theme = "dropdown",
					layout_config = {
						width = 0.5,
						height = 0.4,
						prompt_position = "top",
						preview_cutoff = 120,
					},
				},

				live_grep = {
					only_sort_text = true,
					disable_devicons = true,
					previewer = true,
					layout_config = {
						horizontal = {
							width = 0.9,
							height = 0.75,
							preview_width = 0.6,
						},
					},
				},

				grep_string = {
					only_sort_text = true,
					disable_devicons = true,
					previewer = true,
					layout_config = {
						horizontal = {
							width = 0.9,
							height = 0.75,
							preview_width = 0.6,
						},
					},
				},

				lsp_references = {
					show_line = false,
					disable_devicons = true,
					previewer = true,
					layout_config = {
						horizontal = {
							width = 0.9,
							height = 0.75,
							preview_width = 0.6,
						},
					},
				},

				treesitter = {
					show_line = false,
					previewer = true,
					disable_devicons = true,
					layout_config = {
						horizontal = {
							width = 0.9,
							height = 0.75,
							preview_width = 0.6,
						},
					},
				},

				diagnostics = {
					show_line = false,
					previewer = false,
					disable_devicons = true,
					layout_config = {
						horizontal = {
							width = 0.6,
							height = 0.3,
						},
					},
				},
			},
		})

		-- Telescope keymaps
		vim.keymap.set(
			"n",
			"<leader>?",
			require("telescope.builtin").oldfiles,
			{ desc = "[?] Find recently opened files" }
		)
		vim.keymap.set(
			"n",
			"<leader><space>",
			require("telescope.builtin").buffers,
			{ desc = "[ ] Find existing buffers" }
		)

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
		vim.keymap.set(
			"n",
			"<leader>sw",
			require("telescope.builtin").grep_string,
			{ desc = "[S]earch current [W]ord" }
		)
		vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set(
			"n",
			"<leader>sd",
			require("telescope.builtin").diagnostics,
			{ desc = "[S]earch by [D]iagnostics" }
		)
	end,
}
