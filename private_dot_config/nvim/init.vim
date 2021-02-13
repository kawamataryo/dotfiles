"-------------------------
" 初期設定
"-------------------------

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set smartindent        "改行入力行の末尾にあわせてインデントを増減する
set ignorecase         "検索時に大文字小文字無視
set pumheight=10       "補完メニューの高さ

" 空白文字を可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" 日本語文字化けへの対応
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
lang en_US.UTF-8

"-------------------------
" keymap
"-------------------------

"insert modeでの移動
:imap <c-h> <Left>
:imap <c-j> <Down>
:imap <c-k> <Up>
:imap <c-l> <Right>

"折返し表示での上下移動
noremap j gj
noremap k gk

"leader キーをスペースに
map <Space> <leader>



"-------------------------
" Vim plugin
"-------------------------

call plug#begin('~/.vim/plugged')

"Color scheme
Plug 'morhetz/gruvbox'

"ステータスバーを素敵に
Plug 'vim-airline/vim-airline'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "coc-fzfに必要
Plug 'antoinemadec/coc-fzf'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }


" マルチカーソル
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

"-------------------------
" プラグイン設定
"-------------------------

"coc.nvimのステータスを表示
set statusline^=%{coc#status()}

"color scheme
autocmd vimenter * ++nested colorscheme gruvbox
let  g:gruvbox_contrast_dark = 'hard'

"coc-exploerの起動コマンド
nmap <leader>e :CocCommand explorer<CR>

"coc-fzfの起動
nmap <Space><Space> :CocFzfList<CR>
nmap <C-o> :CocCommand fzf-preview.ProjectFiles<CR>
