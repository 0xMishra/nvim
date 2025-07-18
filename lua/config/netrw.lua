-- Netrw integrations
vim.cmd([[
  let g:netrw_banner= 0

  hi! link netrwMarkFile Search
  let g:netrw_localcopydircmd = 'cp -r'
  let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

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
    nmap <buffer> ff %:w<CR>
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

    " these remaps are just overriden to simplify netrw
    nmap <buffer> s <C-w>z
    nmap <buffer> S <C-w>z
    nmap <buffer> I <C-w>z
    nmap <buffer> i <C-w>z
    nmap <buffer> a <C-w>z
    nmap <buffer> r <C-w>z
    nmap <buffer> <S-l> <C-w>z
    nmap <buffer> L <C-w>z
  endfunction

  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END
]])
