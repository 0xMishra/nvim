vim.cmd([[

  function! CycleBuffers()
    let current_buffer = bufnr('%')   " Get the current buffer number
    let buffer_list = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != current_buffer && bufname(v:val) !~# "^term://" && bufname(v:val) !~# "^netrw://"')
    if empty(buffer_list)
      return
    endif
    let next_buffer = buffer_list[0]
    execute 'buffer ' . next_buffer
  endfunction


  nnoremap <silent> <Tab> :call CycleBuffers()<CR>

  " BUFFER KEYMAPS
  nnoremap <silent><S-w> :bdelete<CR>
  nnoremap <del> :bufdo bd <CR>

  " remove carriage return character
  nnoremap <silent><space>r :%s/\r/\r/g<CR>

  " NETRW CONFIG

  let g:netrw_localcopydircmd = 'cp -r'
  nnoremap <silent><space>f :Explore<CR>

  " SHORTCUT FOR OPENNING THIS CONFIG FILE
  nnoremap <silent><space>c :e ~/.config/nvim/<CR>

  nnoremap <silent><space>k :Telescope keymaps<CR>
  nnoremap  <silent><space>M :Mason<CR>

  nnoremap  <silent><space>l :Lazy<CR>

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
  nnoremap <silent>ff :lua vim.lsp.buf.format()<CR>

]])

-- EOF --
