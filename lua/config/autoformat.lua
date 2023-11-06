-- Define a function to run :Format
function Format_on_write()
  vim.cmd(":Format")
end

-- Set up the autocmd on BufWritePre for specific filetypes
vim.cmd([[
  augroup FormatOnWrite
    autocmd!
    autocmd BufWritePre *.lua,*.json,*.html,*.tsx,*.jsx,*.go,*.py,*.rs lua Format_on_write()
  augroup END
]])
