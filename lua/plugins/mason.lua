-- Define tool list once
local tools = {
	-- language servers
	"lua-language-server",
	"gopls",

	-- formatting/linting tools
	"goimports",
	"gofumpt",
	"golines",
	"prettierd",
}

-- Mason setup
require("mason").setup({
	ensure_installed = tools,
	ui = {
		icons = {
			package_installed = "$",
			package_pending = "-",
			package_uninstalled = "*",
		},
	},
})

-- Auto-install ensure_installed tools with better error handling
local mr = require("mason-registry")

local function ensure_installed()
	for _, tool in ipairs(tools) do
		if mr.has_package(tool) then
			local p = mr.get_package(tool)
			if not p:is_installed() then
				vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
				p:install():once("closed", function()
					if p:is_installed() then
						vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
					else
						vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
					end
				end)
			end
		else
			vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
		end
	end
end

if mr.refresh then
	mr.refresh(ensure_installed)
else
	ensure_installed()
end

vim.keymap.set("n", "<leader>M", ":Mason<CR>", { desc = "Mason", silent = true })
