-- Put this inside your Lazy plugin spec
return {
	"echasnovski/mini.pick",
	version = "*",
	event = "VeryLazy",

	config = function()
		local pick = require("mini.pick")

		pick.setup({
			window = {
				border = "shadow",
				config = nil,
				prompt_caret = "_ ",
				prompt_prefix = "> ",
			},
		})

		-- Set keymaps
		vim.keymap.set("n", "<leader>sf", function()
			pick.builtin.files()
		end, { desc = "Find files" })

		vim.keymap.set("n", "<leader>sg", function()
			pick.builtin.grep_live()
		end, { desc = "Grep string" })

		-- Search string in opened buffer
		vim.keymap.set("n", "<leader>/", function()
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			local items = vim.tbl_map(function(line, i)
				return {
					text = line,
					info = { lnum = i },
				}
			end, lines, vim.fn.range(1, #lines))

			pick.start({
				source = {
					name = "Buffer lines",
					items = items,
					preview = function(item)
						return string.format("%4d │ %s", item.info.lnum, item.text)
					end,
					choose = function(item)
						vim.api.nvim_win_set_cursor(0, { item.info.lnum, 0 })
					end,
				},
			})
		end, { desc = "Search in current buffer" })

		--  Search current buffers
		vim.keymap.set("n", "<leader><space>", function()
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			local items = vim.tbl_map(function(buf)
				local name = vim.fn.fnamemodify(buf.name, ":~:.")
				if name == "" then
					name = "[No Name]"
				end
				return {
					text = string.format("%d: %s", buf.bufnr, name),
					info = { bufnr = buf.bufnr },
				}
			end, buffers)

			pick.start({
				source = {
					name = "Buffers",
					items = items,
					choose = function(item)
						vim.api.nvim_set_current_buf(item.info.bufnr)
					end,
					preview = function(item)
						return string.format(
							"Buffer #%d\n%s",
							item.info.bufnr,
							table.concat(vim.api.nvim_buf_get_lines(item.info.bufnr, 0, 10, false), "\n")
						)
					end,
				},
			})
		end, { desc = "Pick buffer" })
	end,
}
