set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'troydm/easybuffer.vim'
Plugin 'Shougo/vimshell'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'tyru/caw.vim'
Plugin 'vim-scripts/renamer.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 't9md/vim-quickhl'
Plugin 'cespare/vim-toml'

call vundle#end()
filetype plugin indent on

let g:airline#extensions#branch#enabled = 1

"**************** vim-fugitive ****************
map gd :Gvdiff<CR>

"**************** vim-racer ****************
set hidden
let g:racer_cmd = "/home/muraoka/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" quickhl
nmap m <Plug>(quickhl-manual-this)
xmap m <Plug>(quickhl-manual-this)
nmap M <Plug>(quickhl-manual-reset)
xmap M <Plug>(quickhl-manual-reset)

"**************** Caw ****************
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

"***************** NerdTree *****************
"autocmd vimenter * NERDTree
map <silent> <C-e>   :NERDTreeToggle<CR>

"**************** vimshell *******************
nmap <silent> vs :<C-u>VimShellBufferDir<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
nmap <silent> vt :<C-u>VimShellTab<CR>
nmap <silent> vc :<C-u>:VimShellClose<CR>
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ファイルエンコード
set fileencoding=utf-8
" 通常使う文字エンコーディング
set encoding=utf-8
scriptencoding utf-8
" 行番号の表示
set number
" 右下に表示される行・列番号を表示
set ruler
" 自動インデントで各段階に使われる空白の数
set shiftwidth=4
" タブの大きさを4
set tabstop=4
" タブをシフトに置き換える
set expandtab
" バックアップをしない
set nobk
" 対応括弧をハイライト
set showmatch
" 新しい行を開始したときに新しい行のインデントを現在行と同じ量にする
set autoindent
" 新しい行を作った時に高度な自動インデントを行う
set smartindent
" インクリメンタルサーチ
set incsearch
" ステータスラインに表示するウィンドウを設定する
set laststatus=2
" コマンドを画面最下部に表示する
set showcmd
" 現在のモードの表示
set showmode
" 行頭の余白内でTabを打つとshiftwidthの数だけインデントする
set smarttab
" マウスモード有効
set mouse=a
" 検索時ハイライト
set hlsearch

set t_Co=256

" Esc二回押しでハイライトを消去
nmap <silent> <Esc><Esc> :noh<CR>

syntax on
colorscheme desert
"colorscheme molokai
"colorscheme ron

if has("autocmd")
	" ファイルタイプの検索を有効にする
	filetype plugin on
	" ファイルタイプにあわせたインデントを利用
	filetype indent on
	" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
	autocmd FileType c setlocal sw=4 sts=4 ts=4 et
	autocmd FileType go setlocal sw=4 sts=4 ts=4 noet
endif
