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

" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" https://github.com/mattn/webapi-vim
" https://github.com/mattn/emmet-vim
Plug 'mattn/webapi-vim' | Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<Nop>'
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
nnoremap <Leader>cp :<C-u>CopyPath<CR>
nnoremap <Leader>cf :<C-u>CopyFileName<CR>

" https://github.com/tyru/open-browser.vim
Plug 'tyru/open-browser.vim'
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)

" https://github.com/kannokanno/previm
Plug 'kannokanno/previm'
nnoremap <Leader>pv :<C-u>PrevimOpen<CR>

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>
nnoremap <Leader>nf :<C-u>NERDTreeFind<CR>

" https://github.com/Shougo/vimfiler.vim
Plug 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
nnoremap <Leader>vf :<C-u>VimFiler<CR>

" https://github.com/Shougo/unite.vim
Plug 'Shougo/unite.vim'

" https://github.com/Shougo/neomru.vim
Plug 'Shougo/neomru.vim'
nnoremap <Leader>uh :<C-u>Unite file_mru<CR>

" https://github.com/Shougo/neoyank.vim
Plug 'Shougo/neoyank.vim'
nnoremap <Leader>uy :<C-u>Unite history/yank<CR>

" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.DS_Store|Thumbs\.db|node_modules)$'
let g:ctrlp_working_path_mode = 'w' " begin finding a root from the current working directory
nnoremap <Leader>ff :<C-u>CtrlP<CR>

" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_close = 0
nmap <Leader>ss <Plug>CtrlSFPrompt
vmap <Leader>ss <Plug>CtrlSFVwordPath
nnoremap <Leader>sr :<C-u>CtrlSF -R<Space>
nnoremap <Leader>so :<C-u>CtrlSFOpen<CR>
nnoremap <Leader>sc :<C-u>CtrlSFClose<CR>

" https://github.com/w0ng/vim-hybrid
Plug 'w0ng/vim-hybrid'

" https://github.com/NLKNguyen/papercolor-theme
Plug 'NLKNguyen/papercolor-theme'

" https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
let g:lightline = {
                \   'colorscheme': 'solarized',
                \   'active': {
                \     'left': [ [ 'mode', 'paste' ], [], [ 'readonly', 'relativepath', 'modified' ] ],
                \     'right': [ [ 'lineinfo' ], [], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \   },
                \   'inactive': {
                \     'left': [ [], [], [ 'readonly', 'relativepath', 'modified' ] ],
                \     'right': [ [ 'lineinfo' ], [], [] ]
                \   }
                \ }

" https://github.com/nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1
nmap <Leader>ti <Plug>IndentGuidesToggle

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/scrooloose/syntastic
Plug 'scrooloose/syntastic'

" https://github.com/jreybert/vimagit
" <Leader>M to open Magit buffer
Plug 'jreybert/vimagit'

" https://github.com/pangloss/vim-javascript
" https://github.com/mxw/vim-jsx
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'

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

" 背景色の傾向
set background=light

" 背景色の傾向を切り替える
function! ToggleBackground()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction
nnoremap <Leader>tb :<C-u>call ToggleBackground()<CR>

" カラースキームの設定
"colorscheme hybrid
colorscheme PaperColor

" シンタックスハイライト機能を有効にする
syntax enable

" 括弧のハイライトを無効にする
let g:loaded_matchparen = 1

" カレント行をハイライトする
"set cursorline

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
set listchars=tab:--,eol:↵

" タブを表示するときの幅の設定
set tabstop=4

" タブが自動的に挿入されるときの幅の設定
set shiftwidth=4

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
set scrolloff=3

" スワップファイルの設定
set noswapfile

" バックアップファイルの設定
set nobackup
set nowritebackup

" undofileの設定
set noundofile

" 検索の設定
set ignorecase
set smartcase
set incsearch
set hlsearch

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-r>"<CR>

" 検索結果のハイライトを解除する
nnoremap <Leader><Leader> :<C-u>noh<CR>

" http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

nnoremap <Leader>pp :<C-u>echo expand("%:p")<CR>
nnoremap <Leader>rv :<C-u>tab sview ~/.vimrc<CR>
nnoremap <Leader>re :<C-u>tabe ~/.vimrc<CR>
nnoremap <Leader>rr :<C-u>source ~/.vimrc<CR>
