scriptencoding utf-8

" vimrcアンチパターン - rbtnn雑記
" http://rbtnn.hateblo.jp/entry/2014/11/30/174749

set fileencodings=utf-8,cp932 " ファイルの編集時に考慮される文字エンコーディングのリスト
set runtimepath+=$HOME/.vim
source $VIMRUNTIME/macros/matchit.vim " %によるマッチを拡張するプラグイン
let g:mapleader = " "


" {{{ vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" https://github.com/terryma/vim-expand-region
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" https://github.com/mattn/webapi-vim
" https://github.com/mattn/emmet-vim
Plug 'mattn/webapi-vim' | Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<Nop>'
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
nmap <Leader>ee <Plug>(emmet-expand-abbr)
nmap <Leader>er <Plug>(emmet-remove-tag)

" https://github.com/tyru/caw.vim
Plug 'tyru/caw.vim'
nmap <Leader>tc <Plug>(caw:hatpos:toggle)
vmap <Leader>tc <Plug>(caw:hatpos:toggle)

" https://github.com/Chiel92/vim-autoformat
Plug 'Chiel92/vim-autoformat'
nnoremap <Leader>af :<C-u>Autoformat<CR>

" https://github.com/tpope/vim-abolish
Plug 'tpope/vim-abolish'
" crc: camelCase
" crm: MixedCase
" cr_: snake_case
" crs: snake_case
" cru: SNAKE_UPPERCASE
" crU: SNAKE_UPPERCASE
" cr-: dash-case
" crk: kebab-case
" cr.: dot.case

" https://github.com/vim-scripts/copypath.vim
Plug 'vim-scripts/copypath.vim'

" https://github.com/tyru/open-browser.vim
Plug 'tyru/open-browser.vim'
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

" https://github.com/kannokanno/previm
Plug 'kannokanno/previm'

" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_close = 0
nmap <Leader>ss <Plug>CtrlSFPrompt
vmap <Leader>ss <Plug>CtrlSFVwordPath
nnoremap <Leader>sr :<C-u>CtrlSF -R<Space>
nnoremap <Leader>so :<C-u>CtrlSFOpen<CR>
nnoremap <Leader>sc :<C-u>CtrlSFClose<CR>

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.DS_Store|Thumbs\.db|node_modules)$'
let g:ctrlp_working_path_mode = 'w' " begin finding a root from the current working directory
nnoremap <Leader>ff :<C-u>CtrlP<CR>

" https://github.com/fisadev/vim-ctrlp-cmdpalette
Plug 'fisadev/vim-ctrlp-cmdpalette'
"let g:ctrlp_cmdpalette_execute = 1 " selected command to be executed
nnoremap <Leader>p :<C-u>CtrlPCmdPalette<CR>

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>
nnoremap <Leader>nf :<C-u>NERDTreeFind<CR>
"autocmd VimEnter * if !argc() | NERDTree | endif " ファイルが指定されずにVimが起動したら、自動的にNERDTreeを開く

" https://github.com/Shougo/unite.vim
Plug 'Shougo/unite.vim'

" https://github.com/Shougo/neomru.vim
Plug 'Shougo/neomru.vim'
nnoremap <Leader>uh :<C-u>Unite file_mru<CR>

" https://github.com/Shougo/neoyank.vim
Plug 'Shougo/neoyank.vim'
nnoremap <Leader>uy :<C-u>Unite history/yank -default-action=append<CR>
nnoremap <Leader>uY :<C-u>Unite history/yank<CR>

" https://github.com/rakr/vim-one
Plug 'rakr/vim-one'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
"let g:lightline = { 'colorscheme': 'solarized' }

" https://github.com/nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1
nmap <Leader>ti <Plug>IndentGuidesToggle

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/jreybert/vimagit
" <Leader>M to open Magit buffer
Plug 'jreybert/vimagit'

" https://github.com/neomake/neomake
Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['stylelint']

" https://github.com/pangloss/vim-javascript
" https://github.com/mxw/vim-jsx
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'

" https://github.com/posva/vim-vue
Plug 'posva/vim-vue'

" https://github.com/digitaltoad/vim-pug
Plug 'digitaltoad/vim-pug'

call plug#end()
" }}} vim-plug

" Emmetの設定ファイルを読み込む
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/emmet/snippets.json')), "\n"))


" マウスで操作できるようにする
set mouse=a

" 左右のカーソルキーで改行を越える移動を可能にする
set whichwrap=b,s,h,l,<,>,[,],~

" バックスペースの設定
set backspace=indent,eol,start

" ヤンク／カットしたテキストを他のアプリケーションにペーストできるようにする
set clipboard+=unnamed

" カラースキームの設定
colorscheme one

" 背景色の傾向
set background=dark

" シンタックスハイライト機能を有効にする
syntax enable

" 括弧のハイライトを無効にする
let g:loaded_matchparen = 1

" カレント行をハイライトする
set cursorline

" カレント行に下線を表示しない
highlight CursorLine cterm=NONE gui=NONE

" 行番号を表示する
set number

" 常にステータスラインを表示する
set laststatus=2

" タイプ途中のコマンドを画面最下行に表示する
set showcmd

" 空白文字を表示する
set list

" 空白文字の設定
set listchars=tab:--,trail:·

" タブを表示するときの幅の設定
set tabstop=2

" タブが自動的に挿入されるときの幅の設定
set shiftwidth=2

" タブの代わりにスペースを挿入する
" ※タブはCTRL-V<Tab>で挿入できる
set expandtab

" 折り返さない
set nowrap

" 折り返しを切り替える
function! ToggleWrap()
  if &wrap == '1'
    set nowrap
  else
    set wrap
  endif
endfunction
nnoremap <Leader>tw :<C-u>call ToggleWrap()<CR>

" テキスト中の印で折り畳みを定義する
set foldmethod=marker

" ファイルを開いたときに折り畳みをしない
set foldlevelstart=100

" 左右のスクロールを1文字単位でする
set sidescroll=1

" カーソルの上または下に表示する最小限の行数
set scrolloff=6

" スワップファイルの設定
set noswapfile

" バックアップファイルの設定
set nobackup
set nowritebackup

" undofileの設定
set noundofile

" 外部のエディタで編集中のファイルが変更されたら、自動的に読み直す
set autoread

" ウィンドウを移動する度にチェックを行う
" http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" 検索の設定
set ignorecase
set smartcase
set incsearch
set hlsearch

" スペルチェックする
set spelllang=en,cjk
set spell

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-r>"<CR>

" 検索結果のハイライトを解除する
nnoremap <Leader><Leader> :<C-u>noh<CR>

" 保存する
nnoremap <Leader>w :<C-u>update<CR>

" 置換する
nnoremap <Leader>r :<C-u>%s//

" http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" ファイルを開いたときにカーソル位置を復元する
" https://wiki.archlinuxjp.org/index.php/Vim
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

:command! EchoPath :echo expand("%:p")
:command! VimrcView :tab sview ~/.vimrc " http://vim-jp.org/vimdoc-ja/tabpage.html#:tab http://vim-jp.org/vimdoc-ja/windows.html#:sview
:command! VimrcEdit :tabe ~/.vimrc " http://vim-jp.org/vimdoc-ja/tabpage.html#:tabe
:command! VimrcReload :source ~/.vimrc
