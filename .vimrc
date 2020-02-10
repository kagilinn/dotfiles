scriptencoding utf-8

set shell=ksh

filetype off
filetype plugin indent off

"---------------------------------------------------------------------
" グローバルな設定
"---------------------------------------------------------------------
" 対括弧の表示
set showmatch
" 行番号の表示
set number
" バックアップを作成しない
set nobackup
" 非表示の文字を表示
set list
" 非表示の文字をどう表示するか
set listchars=tab:‣\ ,trail:▫︎,eol:⤓
" 一部記号を全角文字として扱う
set ambiwidth=double
" ファイルを開いたら Vim 内のカレントディレクトリを変更
set autochdir

"---------------------------------------------------------------------
" タブ・インデント
"---------------------------------------------------------------------
" タブキーをタブ文字として入力する
set noexpandtab
" タブ文字の表示幅
set tabstop=4
" タブキーを押した際にいくつ移動するか (0 なら tabstop と同じ)
set softtabstop=0
" << や >> などでの移動幅
set shiftwidth=4
" タブキーの挙動を行頭と行頭以外で区別しない
set nosmarttab
" 自動インデントを行う
set autoindent

"--------------------------------------------------------------------------
" autoindent の動作
"--------------------------------------------------------------------------
" Lisp 系のインデントを行うか
set nolisp
" 行頭や行末の {, }, # を認識してインデントするか
set nosmartindent
" C言語スタイルのインデントをするか
set nocindent
" インデントをスクリプトで行う (indentkeys も参照)
"set indentexpr
" smartindent/cindent 時, 追加のインデント開始文字列
"set cinwords
" cindent 時, 以下のキーが押されたらインデントを調整する
"set cinkeys
" cindent の詳細動作設定
"set cinoptions
" indentexpr 時, 以下のキーが押されたらインデントを調整する
"set indentkeys

"--------------------------------------------------------------------------
" 状態表示
"--------------------------------------------------------------------------
" 現在行にアンダーライン
set cursorline
" カーソル位置
set ruler
" 入力中のコマンド
set showcmd
" ステータス行を表示
set laststatus=2
" タブページを常に表示
set showtabline=2

"--------------------------------------------------------------------------
" 検索設定
"--------------------------------------------------------------------------
" 通常検索時, 検索文字列を打ち込んでいる最中に検索し始める
set incsearch
" 通常検索時, 検索文字列に色を付ける
set hlsearch
" 通常検索時, 上下の端まで行ったらそこで検索を止める
set nowrapscan
" 単語の上で ctrl+k を押すと外部grep
nnoremap <C-k> :<C-u>grep '<C-r><C-w>'<CR><CR>
" Ctrl+] もカーソル位置の単語を外部grep (本来は ctags ジャンプ)
nnoremap <C-]> :<C-u>grep '<C-r><C-w>'<CR><CR>
" vimgrep or 外部grep 時に結果を別ペインに表示
autocmd QuickFixCmdPost *grep* cwindow
" 別ペインに表示した前後の検索結果を検索するキーバインド
nnoremap <C-n> :<C-u>cnext<CR>
nnoremap <C-p> :<C-u>cprevious<CR>

" -------------------------------------------------------------------------
" その他のキーバインド
" -------------------------------------------------------------------------
" 擬似スニペット
nnoremap <expr> <SPACE><C-k> ':<C-u>r ~/.vim/snippets/' . &filetype . '/'

"--------------------------------------------------------------------------
" 内蔵ファイラ netrw の設定
"--------------------------------------------------------------------------
" Vim のカレントディレクトリに同期する
let g:netrw_keepdir=0
" 指定したパターンのファイルのみ表示
let g:netrw_hide=2
" パターンは「..」と非ドットファイル
let g:netrw_list_hide='^\.\.\/$,^[^.]'

"--------------------------------------------------------------------------
" ファイルタイプ別の設定を読み込む
"--------------------------------------------------------------------------
" .m は Objective-C と認識させる
let g:filetype_m = 'objc'

"--------------------------------------------------------------------------
" プラグイン管理
"--------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
call plug#end()

" 色分け
syntax on
" 読み込み開始
filetype plugin indent on

if filereadable(expand('~/.vimrc_grep.vim'))
	source ~/.vimrc_grep.vim
endif
if filereadable(expand('~/.vimrc_local.vim'))
	source ~/.vimrc_local.vim
endif

