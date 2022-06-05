
set nocompatible
":terminalで起動するshellをFishに
set shell=fish

" 画面表示の設定

set number         " 行番号を表示する

set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く

" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする



 " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=2
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000
" <Leader>に スペースを割り当て
let mapleader = "\<Space>"
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
"jjをEscにバインド
inoremap <silent> jj <ESC>
"F1キーで.vimrcを開く
nmap <F1> :tabnew $MYVIMRC<CR>
"UTF-8を指定
set encoding=UTF-8
"ステータスラインにGitブランチ名を表示
set statusline=%{FugitiveStatusline()}

"----------------------------------------
" Plugin
"----------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'simeji/winresizer'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'mangeshrex/everblush.vim'
Plug 'yggdroot/indentLine' "インデントに線を追加
Plug 'miyakogi/seiya.vim' "余分な背景等を非表示
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Coc.nvimを導入
Plug 'simeji/winresizer'
Plug 'itchyny/lightline.vim' "ステータスラインをカスタマイズ
Plug 'ryanoasis/vim-devicons' "アイコン導入
Plug 'morhetz/gruvbox'
Plug 'cohama/lexima.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim' "多機能ファイラー
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'sheerun/vim-polyglot' "構文解析
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ayu-theme/ayu-vim'
Plug 'AhmedAbdulrahman/vim-aylin'

call plug#end()

syntax enable
set termguicolors

"tmux用のカラー設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"カラースキーム指定
let ayucolor="dark" 
colorscheme ayu

"Lightlineのテーマ指定
let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"----------------------------------------
" Plugin Settings
"----------------------------------------


"Coc.vim関連の設定

" 補完欄を移動するのにTABキーを用いる
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"Coc.nvim:ノーマルモードで
nmap <silent> gd <Plug>(coc-definition) "定義にジャンプ→Ctrl-oで戻る
nmap <silent> gy <Plug>(coc-type-definition) "型定義を参照
nmap <silent> gi <Plug>(coc-implementation) "implementationを参照
nmap <silent> gr <Plug>(coc-references) "参照

nnoremap <silent> K :call ShowDocumentation()<CR> 
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"Fern.vim関連

let g:fern#renderer = "nerdfont"
" 隠しファイルを表示する
let g:fern#default_hidden=1
"Fern　Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=25<CR>
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" indentLineの設定
let g:indentLine_char = '┊'


