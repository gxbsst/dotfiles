set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#rc()

Plugin 'gmarik/vundle'

"WORDPRESS
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 't9md/vim-ruby-xmpfilter'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-cucumber'
"Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'

Plugin 'vim-ruby/vim-ruby'
Plugin 'jgdavey/vim-blockle'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

Plugin 'jgdavey/vim-turbux'
"Plugin 'skalnik/vim-vroom'


Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'goldfeld/vim-seek'
Plugin 'vim-scripts/ZoomWin'
Plugin 'duff/vim-bufonly'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mattn/gist-vim'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'bling/vim-airline'

" Find Files
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'

" color theme
Plugin 'ricardovaleriano/vim-github-theme' 
Plugin 'tpope/vim-vividchalk'
Plugin 'jgdavey/vim-railscasts'
Plugin 'matthewtodd/vim-twilight'
Plugin 'sickill/vim-sunburst'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vibrantink'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'thingsinjars/Cobalt.vim'

"Plugin 'shemerey/vim-peepopen'

"Plugin 'drmingdrmer/xptemplate'
Plugin 'mattn/emmet-vim'

" snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'snipmate-snippets'
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-snipmate.git'
"Plugin "sudar/vim-wordpress-snippets"

"Plugin 'junegunn/vim-easy-align'

" syntax checker 这个会使vim 保存很慢
"Plugin 'scrooloose/syntastic'

" Show funtion list
"Plugin 'functionlist.vim'

" Rspec
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'

Plugin 'jnwhiteh/vim-golang'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
"Plugin 'vim-scripts/AutoComplPop'

Plugin 'plasticboy/vim-markdown'

call vundle#end()

syntax on
filetype plugin indent on

set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set hidden
set guifont=menlo:h20
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set nofoldenable
set ignorecase smartcase
set autoindent
set backspace=indent,eol,start

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

let mapleader = ","
vmap D y'>p
imap <c-l> <space>=><space>
imap <c-c> <esc>
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap Y y$


function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>P :PromoteToLet<cr>


au BufWritePost .vimrc so ~/.vimrc
autocmd QuickFixCmdPost *grep* cwindow


" StatusLine
if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
let g:Powerline_symbols = 'fancy'

"" fuzzyfinder
map ,,  :FufCoverageFile!<cr>
" 查找项目的文件
map ,.  :FufBuffer!<cr>
" 查找bufferr的文件
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|DS_Store|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate)'
let g:fuf_enumeratingLimit = 5000
let g:fuf_coveragefile_prompt = ':'
let g:fuf_buffer_prompt = ':'

" 右边的边界线
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Turbux
 "let g:turbux_command_rspec  = 'bundle exec rspec --drb'        " default: rspec
 "let g:turbux_command_test_unit = 'ruby'     " default: ruby -Itest
 "let g:turbux_command_cucumber = 'bundle exec cucumber --drb'  " default: cucumber
 "let g:turbux_command_turnip = 'rspec'       " default: rspec -rturnip
 "let g:no_turbux_mappings = 1
 "map <leader>rt <Plug>SendTestToTmux
 "map <leader>rT <Plug>SendFocusedTestToTmux

" Gist
let g:gist_use_password_in_gitconfig = 1

"Vroom
"let g:vroom_spec_command = 'bundle exec rspec --drb'

"map ,rs :!bundle exec rspec --color<cr>

vmap ,cs !coffee -s -c<CR>

" nerdtree
map \n :NERDTreeToggle<CR>

" zencoding
let g:user_zen_expandabbr_key = '<C-e>'

"syntastic
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump=1
let g:syntastic_loc_list_height=5
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_xml_checkers = ['xmllint']

" Unite mapping
let g:unite_source_history_yank_enable = 1
nnoremap \y :<C-u>Unite history/yank<CR>
" nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
nnoremap \r :<C-u>Unite -start-insert file_rec/async:!<CR>
" Most recently used files:
nnoremap \m :<C-u>Unite file_mru<CR>
nnoremap <silent> \b :<C-u>Unite buffer -start-insert <CR>
nnoremap <silent> \B :<C-u>Unite buffer file_mru bookmark -start-insert<CR>

" Funtion list
nnoremap <silent> \t :Flisttoggle<CR>

set noundofile

"colorscheme railscasts
syntax enable
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized
"colorscheme codeschool


" Rspec
"let g:rspec_command = 'call Send_to_Tmux("rspec --drb {spec}\n")'
let g:rspec_command = "!rspec --drb {spec}"
" RSpec.vim mappings
map <Leader>tt :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Fold
" zo Open the fold on the same line as the cursor
" zc Close the fold that the cursor is inside
" zR Open all folds 
" zM Close all folds

set foldmethod=syntax
set foldnestmax=1


"自动提示
"let g:acp_completeoptPreview = 1
" 注释快捷键: gcc
" buffer 转化最近两个
nnoremap bs :b#<CR>
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
" new tab
nnoremap tN :tab new<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tl :tablast<CR>
nnoremap tf :tabfirst<CR>
nnoremap tc :tabclose<CR>

nnoremap \vs :vsplit<CR>
nnoremap \sp :split<CR>


"NeoCompleteEnable
" 参考: https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility=1
let g:neocomplete#force_overwrite_completefunc=1

