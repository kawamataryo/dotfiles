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
set mouse=a            "mouseスクロールONに

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

"terminalのinsertモードの離脱をescにマッピング
:tnoremap <Esc> <C-\><C-n>

"terminalを下に別ペインで開く
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

"teminalを開いたらinsertモードに
autocmd TermOpen * startinsert

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" マルチカーソル
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" ウィンドウサイズの変更を容易に
Plug 'camspiers/animate.vim'

call plug#end()

"-------------------------
" coc vim extentions
"-------------------------

let g:coc_global_extensions = ['coc-eslint', 'coc-explorer', 'coc-fzf-preview', 'coc-html', 'coc-json', 'coc-python', 'coc-sql', 'coc-tabnine', 'coc-tsserver', 'coc-vetur', 'coc-yaml', 'coc-solargraph']


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
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space><CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

"animate.vimのキーバインド windownsサイズの変更
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
