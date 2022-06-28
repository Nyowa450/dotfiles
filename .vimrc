
set nocompatible
":terminalで起動するshellをFishに
set shell=fish

" 画面表示の設定
set number         " 行番号を表示する
set showtabline=2  " always show tabline
set pumheight=16
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

" InsertモードでEmacsのキーバインドを使えるようにする
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>
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
Plug 'cocopon/iceberg.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'sainnhe/sonokai'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/seoul256.vim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'haishanh/night-owl.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

"バッファを切り替える（※バッファはメモリに展開されたファイル）
"必ずしもウィンドウで表示されてるわけではない
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
syntax enable
set termguicolors

"tmux用のカラー設定
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"カラースキーム指定
let mapleader = ","
let ayucolor="dark" 
let background="dark"
colorscheme embark

"use lightline-buffer in lightline
let g:lightline = {
      \ 'colorscheme': 'rosepine',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }


"----------------------------------------
" Plugin Settings
"----------------------------------------
" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = '◀'
let g:lightline_buffer_active_buffer_right_icon = '▶'
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1


"Coc.vim関連の設定

" 補完欄を移動するのにTABキーを用いる
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



"Coc.nvim:ノーマルモードで
nmap <silent> gd <Plug>(coc-definition) "定義にジャンプ→Ctrl-oで戻る
nmap <silent> gy <Plug>(coc-type-definition) "型定義を参照
nmap <silent> gi <Plug>(coc-implementation) "implementationを参照
nmap <silent> gr <Plug>(coc-references) "参照
nmap <silent> gF <Plug>(coc-format-selected) "formatする

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

"透明化
"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight SpecialKey ctermbg=NONE guibg=NONE
"highlight EndOfBuffer ctermbg=NONE guibg=NONE
"highlight LineNr ctermbg=NONE guibg=NONE
"highlight SignCulumn ctermbg=NONE guibg=NONE
"highlight VertSplit ctermbg=NONE guibg=NONE

"if has('gui')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
"endif

"fzf.vimの起動時のウィンドウの高さ
let g:fzf_layout = { 'down': '60%' }

"fzf.vimのショートカット（","+各キーで検索起動）
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>m :Mark<CR>

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

"Markdown関連
"markdown-preview-enhanced.openPreviewを起動（ブラウザで閲覧）
nnoremap <silent> <leader>p :CocCommand markdown-preview-enhanced.openPreview<CR>
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
