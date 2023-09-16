-- Netrw integrations
vim.cmd([[
  let g:netrw_winsize = 30
  let g:netrw_banner= 0
  let g:netrw_localcopydircmd = 'cp -r'
  hi! link netrwMarkFile Search
  function! NetrwRemoveRecursive()
    if &filetype ==# 'netrw'
      cnoremap <buffer> <CR> rm -r<CR>
      normal mu
      normal mf
      try
        normal mx
      catch
        echo "Canceled"
      endtry
      cunmap <buffer> <CR>
    endif
  endfunction
  function! NetrwMapping()
    nmap <buffer> H u
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> P <C-w>z
    nmap <buffer> L <CR>:Lexplore<CR>
    nmap <buffer> <Leader>dd :Lexplore<CR>
    nmap <buffer> fn %:w<CR>
    nmap <buffer> fr R
    nmap <buffer> fc mc
    nmap <buffer> fC mtmc
    nmap <buffer> fx mm
    nmap <buffer> fX mtmm
    nmap <buffer> f; mx
    nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
    nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
    nmap <buffer> bb mb
    nmap <buffer> bd mB
    nmap <buffer> bl gb
    nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
  endfunction
  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END
]])

-- EOF --
