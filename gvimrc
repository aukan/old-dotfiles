set guioptions-=T " hide toolbar
set lines=55 columns=100

colorscheme railscasts

set guifont=DejaVu\ Sans\ Mono:h13

function Fullscreen()
  set columns=1000
  set lines=1000
endfunction
command! Fs :call Fullscreen()

