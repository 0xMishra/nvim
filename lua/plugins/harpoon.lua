return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",

	config = function()
		-- HARPOON INTEGRATIONS
		local harpoon = require("harpoon")

		harpoon:setup({})

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
		end, { desc = "[M]ark file and add to [H]a[R]poon Float" })

		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle [H]a[R]poon Float" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Move to [1]st marked file" })

		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Move to [2]nd marked file" })

		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Move to [3]rd marked file" })

		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Move to [4]th marked file" })

		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Move to [5]th marked file" })

		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Move to [6]th marked file" })

		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(7)
		end, { desc = "Move to [7]th marked file" })

		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(8)
		end, { desc = "Move to [8]th marked file" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<S-Tab>", function()
			harpoon:list():prev()
		end, { desc = "Go to previous file in harpoon list" })

		vim.keymap.set("n", "<Tab>", function()
			harpoon:list():next()
		end, { desc = "Go to next file in harpoon list" })
	end,
}
