-- Set up the autocmd to format on save if there is an lsp attached to the current buffer
-- Define a function to run :Format
-- Define the filetypes you want to trigger :Format for in a table
local filetypes_to_format = { 'lua', 'json', 'html', 'tsx', 'jsx' }

-- Define a function to run :Format
function Format_on_write()
  vim.cmd(":Format")
end

-- Construct the pattern for autocmd based on the filetypes table
local autocmd_pattern = table.concat(filetypes_to_format, ',')

-- Set up the autocmd on BufWritePre for the specified filetypes
vim.cmd(string.format([[
  augroup FormatOnWrite
    autocmd!
    autocmd BufWritePre *.%s lua Format_on_write()
  augroup END
]], autocmd_pattern))
