set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'

Bundle 'vim-ruby/vim-ruby'
Bundle 'jgdavey/vim-blockle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'

Bundle 'jgdavey/vim-turbux'
Bundle 'skalnik/vim-vroom'


Bundle 'mileszs/ack.vim'
Bundle 'ggreer/the_silver_searcher'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'
Bundle 'vim-scripts/ZoomWin'
Bundle 'duff/vim-bufonly'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mattn/gist-vim'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'bling/vim-airline'

" Find Files
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'

" color theme
Bundle 'ricardovaleriano/vim-github-theme' 
Bundle 'tpope/vim-vividchalk'
Bundle 'jgdavey/vim-railscasts'
Bundle 'matthewtodd/vim-twilight'
Bundle 'sickill/vim-sunburst'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vibrantink'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'thingsinjars/Cobalt.vim'

"Bundle 'shemerey/vim-peepopen'

Bundle 'drmingdrmer/xptemplate'
Bundle 'mattn/zencoding-vim'

" snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'vim-snipmate.git'
Bundle 'honza/vim-snippets'

" syntax checker
Bundle 'scrooloose/syntastic'

" Show funtion list
Bundle 'functionlist.vim'

syntax on
filetype plugin indent on

set visualbell
set wildmenu
set wildmode=list:longest,full
set splitright
set splitbelow
set hidden
set guifont=Monaco:h16
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
" let g:turbux_command_rspec  = 'bundle exec rspec --drb'        " default: rspec
" let g:turbux_command_test_unit = 'ruby'     " default: ruby -Itest
" let g:turbux_command_cucumber = 'bundle exec cucumber --drb'  " default: cucumber
" let g:turbux_command_turnip = 'rspec'       " default: rspec -rturnip
" let g:no_turbux_mappings = 1
" map <leader>rt <Plug>SendTestToTmux
" map <leader>rT <Plug>SendFocusedTestToTmux

" Gist
let g:gist_use_password_in_gitconfig = 1

"Vroom
let g:vroom_spec_command = 'bundle exec rspec --drb'

map ,rs :!bundle exec rspec --color<cr>

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
