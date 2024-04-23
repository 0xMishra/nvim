vim.cmd([[
  " AutoIndent a buffer with no LSP installed
  command! AutoIndent :silent execute 'normal gg=G' | :silent update
  nnoremap <silent> <Leader>ai :AutoIndent<CR>

  " for coc tailwind server
  au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']

  " BUFFER KEYMAPS
  nnoremap <silent><S-w> :bdelete<CR>
  nnoremap <silent><del> :bufdo bd <CR>

  nnoremap <space>coc :CocStart<CR>

  " remove carriage return character
  nnoremap <silent><space>r :%s/\r/\r/g<CR>

  " NETRW CONFIG
  nnoremap <silent><space>f :Explore<CR>

  " open vim fugitive
  nnoremap <silent><space>g :G<CR>

  " SHORTCUT FOR OPENNING THIS CONFIG FILE
  nnoremap <silent><space>sk :Telescope keymaps<CR>
  nnoremap  <silent><space>M :Mason<CR>

  nnoremap <C-d> <C-d>zz
  nnoremap <C-u> <C-u>zz

  " escaping the terminal
  tnoremap <Esc> <C-\><C-n>

  autocmd TermEnter * setlocal nobuflisted

  " open terminal in insert mode by default
  augroup insertonenter
    function! InsertOnTerminal()
      if &buftype ==# "terminal"
        normal i
      endif
    endfunction

    autocmd! BufEnter * call InsertOnTerminal()

    if has('nvim')
      autocmd! TermOpen * call InsertOnTerminal()
    endif
  augroup END

  " Disable line numbers in terminal buffers
  augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END

  autocmd TermEnter * call winrestview({'topline': line('$')})

  " formatting a buffer
  nnoremap <silent> <space>bf :lua vim.lsp.buf.format()<CR>
]])
