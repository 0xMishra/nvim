-- FORMAT ON SAVE
require("lsp-format").setup {
  html = { { cmd = { "prettier -W" } } },
  json = { { cmd = { "prettier -W" } } },
  yaml = { { cmd = { "prettier -W" } } },
  lua = { {
    cmd = {
      function()
        return string.format(
          'lua-format i --no-keep-simple-function-one-line --no-spaces-inside-functiondef-parens --break-after-table-lb --no-spaces-inside-functioncall-parens --indent-width=2 %s')
      end
    }
  } },
  rust = { { cmd = { "prettier -W" } } },
  javascriptreact = { { cmd = { "prettier -W", "./node_modules/.bin/eslint --fix" } } },
  javascript = { { cmd = { "prettier -W", "./node_modules/.bin/eslint --fix" } } },
  typescriptreact = { { cmd = { "prettier -W", "./node_modules/.bin/eslint --fix" } } },
  typescript = { { cmd = { "prettier -W", "./node_modules/.bin/eslint --fix" } } }
}


vim.cmd('autocmd BufWritePost * Format')
