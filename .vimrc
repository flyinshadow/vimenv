" When .vimrc is edited, reload it
autocmd!  
autocmd bufwritepost .vimrc source %


""""""""""""""""""""""""""""""
" basic settings
""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable filetype plugins
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin on
filetype indent on

" Set mapleader
let mapleader = ","

" Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<CR>

" Use utf8 first
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,cp936,latin1
set termencoding=utf8

" Avoid menu unreadable characters 
if has("gui_running")
    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  "enable mouse=a will disable left&right mouse button, so let it off
  "set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"if &term=="xterm"
"     set t_Co=8
"     set t_Sb=[4%dm
"     set t_Sf=[3%dm
"endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
"let &guicursor = &guicursor . ",a:blinkon0"

set backspace=indent,eol,start " allow backspacing over everything in insert mode @see help bs
set nobackup        " do not keep a backup file, use versions instead
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set number          " show row number
set showcmd         " display incomplete commands
"set showmatch
"set statusline=%F\ [%{&fenc}\ %{&ff}\ %l/%L]
set incsearch       " do incremental searching
set laststatus=2
set tabstop=4       " ts:tab键所占空格宽度
set shiftwidth=4    " sw:(自动)缩进所占空格宽度
set noexpandtab
"note: not use smart&auto-indent, instead, use filetype indent
"set smartindent    " 解决 shiftwidth 和 tabstop 不等时的麻烦：在行首输入 tab 时插入宽度为 shiftwidth 的空白，在其他地方按 tabstop 和 softtabstop处理
"set autoindent     " always set autoindenting on
"set softtabstop    " 如果设置，则不用改变 tabstop，但让编辑时输入 tab 看起来是指定的宽度，输入 tab 时会插入的 tab 和空格的混合，比如 tabstop=4，softtabstop=10，那么插入 tab 时会将光标移动 10 个字符，可能会是两个 tab 加两个空格，这对 backspace 也有效。
"set wrap
syntax on
set vb t_vb=            " vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
"set foldenable
"set foldmethod=marker  " 设置折叠方式，marker表示使用标志标识折叠，默认标识是：foldmarker={{{,}}}
colorscheme desert      " 使用desert.vim配色方案

set pastetoggle=<F12>

""""""""""""""""""""""""""""""
" => Load pathogen to manage all plugins in ~/.vim/bundle
" note: put this section after SetTitle() will cause it doesn't work
" and I don't know why
""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()


""""""""""""""""""""""""""""""
" for filetype
"""""""""""""""""""""""""""""""
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

"markdown  
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd  

"html同时设置js、css类型，方便snipptMate插件工作
"autocmd BufNewFile,BufRead *.html set filetype=html.javascript.css

"根据文件类型设置缩进格式
au FileType html,vim setl shiftwidth=2
au FileType html,vim setl tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" 新文件头   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
autocmd BufNewFile *.php,*.sh,*.py exec ":call SetTitle()"   

" 定义函数SetTitle，自动插入文件头   
" add ! to overwrite the existing func and avoid redefine error when reload
func! SetTitle() 
    if &filetype == 'php'   
        call setline(1, '<?php')   
        call append(line("."),   '/**')   
        call append(line(".")+1, ' * @author WangJun <wangjun@baijiahulian.com>')   
        call append(line(".")+2, ' * @copyright 2015 baijiahulian.com')   
        call append(line(".")+3, ' */')  
        call append(line(".")+4, '')  
	elseif &filetype == 'sh'   
        call setline(1,"#!/bin/bash")   
        call append(line("."), "")   
    elseif &filetype == 'python'  
        call setline(1,"#!/usr/bin/env python")  
        call append(line("."),"# coding=utf-8")  
        call append(line(".")+1, "")   
    endif  
endfunc   

""新建文件后，自动定位到文件末尾  
autocmd BufNewFile * normal G  

""""""""""""""""""""""""""""""
" for phpdoc
"""""""""""""""""""""""""""""""
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

""""""""""""""""""""""""""""""
" for phpcomplete
"""""""""""""""""""""""""""""""
set completeopt=longest,menu,preview 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

""""""""""""""""""""""""""""""
" for ctag & cscope
"""""""""""""""""""""""""""""""
set tags=~/work/www/src/tags

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" use cscope in quickfix
" set cscopequickfix=s-,c-,d-,i-,t-,e-
" 0 或 s: 查找本符号
" 1 或 g: 查找本定义
" 2 或 d: 查找本函数调用的函数
" 3 或 c: 查找调用本函数的函数
" 4 或 t: 查找本字符串
" 6 或 e: 查找本 egrep 模式
" 7 或 f: 查找本文件
" 8 或 i: 查找包含本文件的文件
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>

""""""""""""""""""""""""""""""
" for taglist
""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"use F9 to open taglist only
map <silent> <F9> :TlistToggle<cr> 

" for use of taglist, press [F9] to toggle taglist
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

""""""""""""""""""""""""""""""
" for neocomplcache
""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""
" MiniBuf
"""""""""""""""""""""""""""""""
"<C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开 
"<C-S-Tab> 向后循环切换到每个buffer上,并在但前窗口打开 
let g:miniBufExplMapCTabSwitchBufs=1 
"用<C-h,j,k,l>切换到上下左右的窗口
let g:miniBufExplMapWindowNavVim=1 
"用<C-箭头键>切换到上下左右窗口中
let g:miniBufExplMapWindowNavArrows=1 
let g:miniBufExplModSelTarget=1 



set runtimepath+=~/.vim_runtime

"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim
"source ~/.vim_runtime/my_configs.vim


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
source ~/.vim_runtime/plugin/winmanager.vim
let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 


""""""""""""""""""""""""""""""
" some extra settings
""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on if possible
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("persistent_undo")
"	"mkdir只能用绝对路径
"	let s:undodir= $HOME.'/.vim/undodir'
"	if !isdirectory(s:undodir)
"		call mkdir(s:undodir)
"	endif
"    set undodir=s:undodir
"    set undofile
"endif

