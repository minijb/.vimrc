syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99




source $VIMRUNTIME/mswin.vim
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
map S :w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map qw :set splitright<CR>:vsplit<CR>" 
map po :set nosplitright<CR>:vsplit<CR>
map op :vertical resize +5<CR>
map wq :vertical resize -5<CR>
map ta :tabe<CR>
map tq :+tabnext<CR>
map tp :-tabnext<CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8







call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'



" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'


call plug#end()


let g:indent_guides_enable_on_vim_startup = 1

" #####YouCompleteMe Configure   
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  
" 自动补全配置  
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项  
"上下左右键的行为 会显示其他信息  
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"  
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"  
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"  
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"  
  
"youcompleteme  默认tab  s-tab 和自动补全冲突  
"let g:ycm_key_list_select_completion=['<c-n>']  
let g:ycm_key_list_select_completion = ['<Down>']  
"let g:ycm_key_list_previous_completion=['<c-p>']  
let g:ycm_key_list_previous_completion = ['<Up>']  
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示  
  
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全  
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic  
"nnoremap <leader>lo :lopen<CR> "open locationlist  
"nnoremap <leader>lc :lclose<CR>    "close locationlist  
inoremap <leader><leader> <C-x><C-o>  
"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
"在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  
"注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  
" #####YouCompleteMe Configure  


colorscheme snazzy
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }


map tt :NERDTreeToggle<CR>


