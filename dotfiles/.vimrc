scriptencoding utf-8
set runtimepath+=$HOME/.vim
source $VIMRUNTIME/macros/matchit.vim " %によるマッチを拡張するプラグイン




" ====================
" vim-plug
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')


" --------------------
" surround.vim
" http://www.vim.org/scripts/script.php?script_id=1697

Plug 'tpope/vim-surround'


" --------------------
" indentLine
" https://github.com/Yggdroot/indentLine

Plug 'Yggdroot/indentLine'


" --------------------
" vim-autoformat
" https://github.com/Chiel92/vim-autoformat

Plug 'Chiel92/vim-autoformat'


" --------------------
" CommentAnyWay
" http://www.vim.org/scripts/script.php?script_id=2554

Plug 'tyru/caw.vim'


" --------------------
" open-browser.vim
" http://www.vim.org/scripts/script.php?script_id=3133

Plug 'tyru/open-browser.vim'


" --------------------
" webapi-vim
" http://www.vim.org/scripts/script.php?script_id=4019

Plug 'mattn/webapi-vim'


" --------------------
" Emmet
" https://github.com/mattn/emmet-vim

Plug 'mattn/emmet-vim'

let g:user_emmet_mode = 'iv' " インサートモードとビジュアルモードでのみ有効にする
let g:user_emmet_leader_key = '<C-e>'


" --------------------
" unite.vim
" http://www.vim.org/scripts/script.php?script_id=3396

Plug 'Shougo/unite.vim'


" --------------------
" neomru.vim
" https://github.com/Shougo/neomru.vim

Plug 'Shougo/neomru.vim'


" --------------------
" Vimfiler
" https://github.com/Shougo/vimfiler.vim

Plug 'Shougo/vimfiler.vim'

let g:vimfiler_as_default_explorer=1


" --------------------
" The NERD Tree
" https://github.com/scrooloose/nerdtree

Plug 'scrooloose/nerdtree'

let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1


" --------------------
" ctrlp.vim
" http://kien.github.io/ctrlp.vim/

Plug 'ctrlpvim/ctrlp.vim'


" --------------------
" ctrlsf.vim
" https://github.com/dyng/ctrlsf.vim

Plug 'dyng/ctrlsf.vim'

let g:ctrlsf_auto_close = 0


" --------------------
" fugitive.vim
" http://www.vim.org/scripts/script.php?script_id=2975

Plug 'tpope/vim-fugitive'


" --------------------
" vim-gitgutter
" https://github.com/airblade/vim-gitgutter

Plug 'airblade/vim-gitgutter'


" --------------------
" syntastic
" https://github.com/scrooloose/syntastic

Plug 'scrooloose/syntastic'


" --------------------
" hybrid
" https://github.com/w0ng/vim-hybrid

Plug 'w0ng/vim-hybrid'


" --------------------
" lightline.vim
" https://github.com/itchyny/lightline.vim

Plug 'itchyny/lightline.vim'

let g:lightline = { 'colorscheme': 'wombat' }


" --------------------
" yankround.vim
" https://github.com/LeafCage/yankround.vim

Plug 'LeafCage/yankround.vim'


" --------------------
" copypath.vim
" http://www.vim.org/scripts/script.php?script_id=1456

Plug 'vim-scripts/copypath.vim'


" --------------------
" Preview
" https://github.com/greyblake/vim-preview

Plug 'greyblake/vim-preview'


call plug#end()




" ファイルの編集時に考慮される文字エンコーディングのリスト
set fileencodings=utf-8,cp932

" マウスで操作できるようにする
set mouse=a

" ヤンク／カットしたテキストを他のアプリケーションにペーストできるようにする
set clipboard+=unnamed

" カラースキームの設定
colorscheme hybrid

" 背景色の傾向
set background=dark

" シンタックスハイライト機能を有効にする
syntax enable

" 括弧のハイライトを無効にする
let loaded_matchparen = 1

" 左右のカーソルキーで改行を越える移動を可能にする
set whichwrap=b,s,h,l,<,>,[,],~

" 行番号を表示する
set number

" タイプ途中のコマンドを画面最下行に表示する
set showcmd

" 折り返さない
set nowrap

" 常にステータスラインを表示する
set laststatus=2

" カーソル行を中央に表示する
"set scrolloff=999

" 左右のスクロールを1文字単位でする
set sidescroll=1

" 空白文字を表示する
set list

" 空白文字の設定
set listchars=tab:--,eol:↵

" タブを表示するときの幅の設定
set tabstop=4

" タブが自動的に挿入されるときの幅の設定
set shiftwidth=4

" バックスペースの設定
set backspace=indent,eol,start

" スワップファイルの設定
set noswapfile

" バックアップファイルの設定
set nobackup

" undofileの設定
set noundofile

" 検索の設定
set ignorecase
set smartcase
set incsearch
set hlsearch

" Esc2連打で検索結果のハイライトを解除する
nmap <Esc><Esc> :noh<CR><Esc>

" カレント行をハイライトする
"set cursorline

" カレント行に下線を表示しない
highlight CursorLine cterm=NONE gui=NONE

" テキスト中の印で折畳を定義する
set foldmethod=marker

" 拡張子がmdのファイルをMarkdownファイルとして認識させる
autocmd BufNewFile,BufRead *.md set filetype=markdown

" 折り返しを切り替える
function! ToggleWrap()
  if &wrap == '1'
    set nowrap
  else
    set wrap
  endif
endfunction

" Emmetの設定ファイルを読み込む
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/emmet/snippets.json')), "\n"))



" ====================
" キーマップ

let mapleader = ";"
nnoremap <Leader>rv :<C-u>tab sview ~/.vimrc<CR>
nnoremap <Leader>re :<C-u>tabe ~/.vimrc<CR>
nnoremap <Leader>rr :<C-u>source ~/.vimrc<CR>
nnoremap <Leader>ep :<C-u>echo expand("%:p")<CR>
nnoremap <Leader>tw :<C-u>call ToggleWrap()<CR>

" vim-autoformat
nnoremap <Leader>af :<C-u>Autoformat<CR>

" copypath.vim
nnoremap <Leader>cp :<C-u>CopyPath<CR>
nnoremap <Leader>cn :<C-u>CopyFileName<CR>

" CommentAnyWay
nmap <Leader>ca <Plug>(caw:i:toggle)
vmap <Leader>ca <Plug>(caw:i:toggle)

" open-browser.vim
nmap <Leader>ob <Plug>(openbrowser-smart-search)
vmap <Leader>ob <Plug>(openbrowser-smart-search)

" fugitive.vim
nnoremap <Leader>ga :<C-u>Gwrite<CR>
nnoremap <Leader>gb :<C-u>Gblame<CR>
nnoremap <Leader>gc :<C-u>Gcommit<CR>
nnoremap <Leader>gC :<C-u>Git commit --amend<CR>
nnoremap <Leader>gd :<C-u>Gdiff<CR>
nnoremap <Leader>gl :<C-u>Glog<CR>
nnoremap <Leader>gs :<C-u>Gstatus<CR>

" The NERD Tree
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>
nnoremap <Leader>nf :<C-u>NERDTreeFind<CR>

" unite.vim
nnoremap <Leader>uf :<C-u>Unite file_rec<CR>
nnoremap <Leader>uh :<C-u>Unite file_mru<CR>

" ctrlp.vim
let g:ctrlp_map = '<Nop>'
nnoremap <Leader>pp :<C-u>CtrlP<CR>

" ctrlsf.vim
nmap <Leader>ff <Plug>CtrlSFPrompt
nnoremap <Leader>fr :<C-u>CtrlSF -R<Space>
nnoremap <Leader>fo :<C-u>CtrlSFOpen<CR>
nnoremap <Leader>fc :<C-u>CtrlSFClose<CR>
vmap <Leader>ff <Plug>CtrlSFVwordPath

" yankround.vim
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
