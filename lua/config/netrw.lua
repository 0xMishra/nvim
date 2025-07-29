-- Netrw integrations
vim.cmd([[
  let g:netrw_banner= 0

  hi! link netrwMarkFile Search
  let g:netrw_localcopydircmd = 'cp -r'
  let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
  let g:netrw_list_hide = '^\.\./$,^\./$'

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
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> ff %:w<CR>
    nmap <buffer> fr R
    nmap <buffer> fC mtmc
    nmap <buffer> fX mtmm
    nmap <buffer> FF :call NetrwRemoveRecursive()<CR>

    " these remaps are just overriden to simplify netrw
    nmap <buffer> s <Nop>
    nmap <buffer> S <Nop>
    nmap <buffer> I <Nop>
    nmap <buffer> i <Nop>
    nmap <buffer> a <Nop>
    nmap <buffer> r <Nop>
    nmap <buffer> <S-l> <Nop>
    nmap <buffer> L <Nop>
  endfunction

  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END
]])
