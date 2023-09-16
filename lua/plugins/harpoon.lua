-- HARPOON INTEGRATIONS
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local term = require("harpoon.term")

vim.keymap.set("n", "<space>m", mark.add_file)

vim.keymap.set("n", "<space>h", ui.toggle_quick_menu)

-- TERMINAL SHORTCUT
vim.keymap.set("n", "<space>t", function()
  term.gotoTerminal(1)
end)
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

vim.cmd("autocmd TermOpen * startinsert")

vim.keymap.set("n", "<space>1", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<space>2", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<space>3", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<space>4", function()
  ui.nav_file(4)
end)
vim.keymap.set("n", "<space>5", function()
  ui.nav_file(5)
end)
vim.keymap.set("n", "<space>6", function()
  ui.nav_file(6)
end)
vim.keymap.set("n", "<space>7", function()
  ui.nav_file(7)
end)
vim.keymap.set("n", "<space>8", function()
  ui.nav_file(8)
end)
