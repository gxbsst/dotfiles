set guifont=Inconsolata-g:h15
" make the toolbar stay hidden after a restart
"set guioptions-=T
" set lines=40
" set columns=100

"set guifont=Inconsolata:h20            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
"set background=light              " Background.
set lines=25 columns=100          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar
if has("gui_macvim")
   macmenu &File.New\ Tab key=<nop>
   map <D-t> <Plug>PeepOpen
end

" GUARD RSPEC ConqueTerm 
" http://sociable.co.nz/
" Function which runs a command using ConqueTerm in the
" current or split buffer.
" If no command is given it just runs bash.
function! RunCommandInBuffer(where,...)
  " Can split the buffer if you want.
  if a:where == 'new'
    exec ':new'
  elseif a:where == 'vnew'
    exec ':vnew'
  end
  " run a shell if no other arguments are supplied
  if a:0 == 0
    exec ':ConqueTerm bash'
  else
    exec ':ConqueTerm ' . join(a:000, ' ')
  endif
endfunction
" http://code.google.com/p/conque/wiki/Usage#2.1_General_Usage
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_Color = 1
"let g:ConqueTerm_CloseOnEnd = 0
"let g:ConqueTerm_FastMode = 1

" User commands to call RunCommandInBuffer nicely.
command! -nargs=* Exec :call RunCommandInBuffer('here',<f-args>)
command! -nargs=* SplitExec :call RunCommandInBuffer('new',<f-args>)
command! -nargs=* VSplitExec :call RunCommandInBuffer('vnew',<f-args>)

" Command Aliases via cmdalias:
"call CmdAlias('exec', 'Exec')
"call CmdAlias('splitexec', 'SplitExec')
"call CmdAlias('vsplitexec', 'VSplitExec')
"call CmdAlias('se', 'SplitExec')
"call CmdAlias('vse', 'VSplitExec')


let g:ConqueTerm_Syntax = 'conque'
"let g:ConqueTerm_Color = 1
let g:ConqueTerm_TERM='xterm-color' 
let g:ConqueTerm_InsertOnEnter=0 
let g:ConqueTerm_TERM = 'vt100'
"let g:ruby_conque_rspec_command='spec'
" Cmd-Shift-R for RSpec
"nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
"nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
"nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>

"colorscheme railscasts
"colorscheme sunburst
"colorscheme github

" Command-Shift-F for Ack
map <D-F> :Ack<space>

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

set viminfo^=!

let g:NERDTreeWinPos = "left"

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

set guioptions-=L
set guioptions=-t
