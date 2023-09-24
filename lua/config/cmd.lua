vim.cmd([[

  " BUFFER KEYMAPS
  nnoremap <silent><S-w> :bdelete<CR>
  nnoremap <del> :bufdo bd <CR>

  " remove carriage return character
  nnoremap <silent><space>r :%s/\r/\r/g<CR>

  " NETRW CONFIG

  let g:netrw_localcopydircmd = 'cp -r'
  nnoremap <silent><space>f :Explore<CR>
  command! AutoIndent :silent execute 'normal gg=G<C-o>' | :silent update
  nnoremap <silent> <Leader>ai :AutoIndent<CR>

  " SHORTCUT FOR OPENNING THIS CONFIG FILE
  nnoremap <silent><space>c :e ~/.config/nvim/<CR>

  nnoremap <silent><space>k :Telescope keymaps<CR>
  nnoremap  <silent><space>M :Mason<CR>

  nnoremap  <silent><space>l :PackerSync<CR>

  " escaping the terminal
  tnoremap <Esc> <C-\><C-n>

  nnoremap <C-d> <C-d>zz
  nnoremap <C-u> <C-u>zz


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

  " EMMET CONFIG
  autocmd TermEnter * call winrestview({'topline': line('$')})

  " formatting a buffer
  nnoremap <silent>bf :lua vim.lsp.buf.format()<CR>

]])
