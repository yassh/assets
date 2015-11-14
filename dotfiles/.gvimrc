set guioptions-=T
set columns=135
set lines=45
set guifont=Inconsolata:h16
set guifontwide=VL\ Gothic:h16
colorscheme hybrid
autocmd GUIEnter * if !argc() | cd ~ | endif
