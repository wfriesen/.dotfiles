let b:prettier_ft_default_args = {
  \ 'parser': 'typescript'
  \ }

augroup Prettier
  autocmd!
  if g:prettier#autoformat
    autocmd BufWritePre <buffer> call prettier#Autoformat()
  endif
augroup end
