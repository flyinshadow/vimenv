" When .vimrc is edited, reload it
autocmd!
autocmd bufwritepost .vimrc source %

""""""""""""""""""""""""""""""
" Set up Vundle to manage plugins
""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
"Plugin 'oplatek/Conque-Shell'
Plugin 'tpope/vim-fugitive'
"Plugin 'joonty/vdebug.git'
Plugin 'Shougo/neocomplete.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'mbbill/undotree'
Plugin 'elzr/vim-json'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rking/ag.vim'
Plugin 'beyondwords/vim-twig'
Plugin 'bling/vim-bufferline'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'taglist.vim'
"Plugin 'VimIM'

" PHP {
	Plugin 'mikehaertl/pdv-standalone'
	Plugin 'joonty/vim-phpqa.git'
	Plugin 'flyinshadow/php_localvarcheck.vim'
	Plugin 'arnaud-lb/vim-php-namespace'
	"Plugin 'tobyS/pdv'
	"Plugin 'doxygentoolkit.vim'
" }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""
" => General
" many awesome config from <http://amix.dk/vim/vimrc.html>
""""""""""""""""""""""""""""""
" Enable aliases in vim non-interactive mode :!<cmd>
let $BASH_ENV = "~/.bash_aliases"

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<CR>

" Using utf8
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,cp936,latin1
set termencoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set n lines to the cursor - when moving vertically using j/k
set so=5

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest
set completeopt=longest,menu,preview

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Set ignorecase
set ic
nnoremap <leader>ic :set ic<cr>
nnoremap <leader>ni :set noic<cr>

" Split window pos
set splitright
set splitbelow

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
"set tm=500 "键序列的超时等待时间

" After exit vim, retain the screen
set t_te=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
"colorscheme solarized
colorscheme desert

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Avoid menu unreadable characters
if has("gui_running")
    set langmenu=zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
"set nowb
"set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" 解决 shiftwidth 和 tabstop 不等时的麻烦：
" 在行首输入 tab 时插入宽度为 shiftwidth 的空白，
" 在其他地方按 tabstop 和 softtabstop处理
set smarttab

" ts: 1 tab == 4 spaces
set tabstop=4
" sw: (自动)缩进所占空格宽度
set shiftwidth=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>/ :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
"map <leader>bd :Bclose<cr>
map <leader>bd :bd<cr>

" Close all the buffers. seem dangerous...
"map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  " Always show the tabbar
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"UPPERCASE and lowercase conversion
nnoremap g^ gUiW
nnoremap gv guiW

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Visual shifting (does not exit Visual mode)
"vnoremap < <gv
"vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
set pastetoggle=<F12>

if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
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

set number          " show row number
set showcmd         " display incomplete commands
"set statusline=%F\ [%{&fenc}\ %{&ff}\ %l/%L]
"set softtabstop    " 如果设置，则不用改变 tabstop，但让编辑时输入 tab 看起来是指定的宽度，输入 tab 时会插入的 tab 和空格的混合，比如 tabstop=4，softtabstop=10，那么插入 tab 时会将光标移动 10 个字符，可能会是两个 tab 加两个空格，这对 backspace 也有效。
"set foldenable
"set foldmethod=marker  " 设置折叠方式，marker表示使用标志标识折叠，默认标识是：foldmarker={{{,}}}
"autocmd FileType php setl fdm=syntax | setl fen


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
" for PDV
"""""""""""""""""""""""""""""""
"  inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
"  nnoremap <C-P> :call PhpDocSingle()<CR>
"  vnoremap <C-P> :call PhpDocRange()<CR>
let g:pdv_cfg_Author = 'WangJun <wangjun@baijiahulian.com>'
let g:pdv_cfg_Copyright = '2015 baijiahulian.com'
nnoremap <leader>pd :call PhpDocSingle()<CR>

""""""""""""""""""""""""""""""
" for vim-phpqa
""""""""""""""""""""""""""""""
" Configuration
let g:phpqa_codesniffer_args = "--standard=PSR2"
" let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"
" let g:phpqa_codecoverage_file = "/path/to/clover.xml"

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0

" You can toggle markers with the following commands (in command mode):
" <Leader>qa  " Show/hide code sniffer and mess detector violations
" <Leader>qc  " Show/hide code coverage markers
" You can also run each command separately on demand:
" :Php - check for syntax errors
" :Phpcs - run code sniffer
" :Phpmd - run mess detector (will ask for a rule XML file if not set)
" :Phpcc - show code coverage (will ask for a clover XML file if not set)

""""""""""""""""""""""""""""""
" for php_localvarcheck
""""""""""""""""""""""""""""""
"set regexpengine=1

""""""""""""""""""""""""""""""
" for ctag & cscope
"""""""""""""""""""""""""""""""
set tags=~/work/www/tags
nnoremap <leader>ta :ta<CR>
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

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
let Tlist_Use_Right_Window=1 
"let tlist_php_settings = 'php;c:class;f:function;d:constant;v:variable'
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" for use of taglist, press [F12] to toggle taglist
nmap <silent> <F12> :TlistToggle<cr>
nnoremap <leader>tl :TlistToggle<CR>

""""""""""""""""""""""""""""""
" for nerdtree
""""""""""""""""""""""""""""""
map <silent> <F11> :NERDTreeToggle<cr>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1

" Open NERDTree by default
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" http://stackoverflow.com/questions/2066590/automatically-quit-vim-if-nerdtree-is-last-and-only-buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif
autocmd bufenter * if (winnr("$") == 2 && bufwinnr(g:TagList_title)!=-1 && exists("b:NERDTree")) | TlistClose | q | endif

""""""""""""""""""""""""""""""
" for NERDCommenter
""""""""""""""""""""""""""""""
",cu 取消注释
",cc 使用注释

"""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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


"set runtimepath+=~/.vim_runtime
"source ~/.vim_runtime/vimrcs/basic.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim
"source ~/.vim_runtime/my_configs.vim

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"   let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
"   let g:winManagerWidth = 30
"   let g:defaultExplorer = 0
"   nmap wm :WMToggle<cr>
"   "nmap <silent> <leader>wm :WMToggle<cr>

""""""""""""""""""""""""""""""
" namespace setting
""""""""""""""""""""""""""""""
noremap <Leader>ns :call PhpInsertUse()<CR>
noremap <Leader>ne :call PhpExpandClass()<CR>

""""""""""""""""""""""""""""""
" vdebug setting
""""""""""""""""""""""""""""""
let g:vdebug_options = {
\ 'port':9090,
\ 'watch_window_style':'compact',
\}
"<F5>: start/run (to next breakpoint/end of script)
"<F2>: step over
"<F3>: step into
"<F4>: step out
"<F6>: stop debugging
"<F7>: detach script from debugger
"<F9>: run to cursor
"<F10>: toggle line breakpoint
"<F11>: show context variables (e.g. after "eval")
"<F12>: evaluate variable under cursor
":Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
":VdebugEval <code>: evaluate some code and display the result
"<Leader>e: evaluate the expression under visual highlight and display the result
"To stop debugging, press <F6>. Press it again to close the debugger interface.
""""""""""""""""""""""""""""""
" debugger setting
""""""""""""""""""""""""""""""
"let g:debuggerPort = 9090

""""""""""""""""""""""""""""""
" VimIM setting
""""""""""""""""""""""""""""""
let g:Vimim_cloud = 'baidu'
"let g:Vimim_mode = 'dynamic'
"let g:Vimim_mycloud = 0
"let g:Vimim_punctuation = 2
"let g:Vimim_shuangpin = 0
"let g:vimim_plugin = 'C:/var/mobile/vim/vimfiles/plugin'
"let g:vimim_custom_laststatus=1
let g:Vimim_toggle = 'pinyin,baidu'

""""""""""""""""""""""""""""""
" Syntastic setting
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_php_checkers = ["php", "phplint"]
"phpcs，tab 4个空格，编码参考使用CodeIgniter风格
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1" 

""""""""""""""""""""""""""""""
" easymotion setting
""""""""""""""""""""""""""""""
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

""""""""""""""""""""""""""""""
" ctrlp setting
""""""""""""""""""""""""""""""
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

nnoremap <Leader>mr :CtrlPMRU<Cr>
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:100'

"""""""""""""""""""""""""""""
" ctrlp-funky
"""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
	" CtrlP extensions
	let g:ctrlp_extensions = ['funky']

	"funky
	nnoremap <Leader>fu :CtrlPFunky<Cr>
endif

""""""""""""""""""""""""""""""
" vim-airline setting
""""""""""""""""""""""""""""""
"let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"""""""""""""""""""""""""""""""
" undotree settings
""""""""""""""""""""""""""""""
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

"""""""""""""""""""""""""""""""
" vim-fugitiv settings
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Glog<CR>
"nnoremap <silent> <leader>gc :Gcommit<CR>
"nnoremap <silent> <leader>gb :Gblame<CR>
"nnoremap <silent> <leader>gp :Git push<CR>
"nnoremap <silent> <leader>gr :Gread<CR>
"nnoremap <silent> <leader>gw :Gwrite<CR>
"nnoremap <silent> <leader>ge :Gedit<CR>

"""""""""""""""""""""""""""""
" vim-json
"""""""""""""""""""""""""""""
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal=0


"""""""""""""""""""""""""""""
" editorconfig-vim
"""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"""""""""""""""""""""""""""""
" ag.vim
"""""""""""""""""""""""""""""
let g:ag_highlight=1
let g:ag_format="%f:%l:%c:%m"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Shell command {
function! s:RunShellCommand(cmdline)
	botright new

	setlocal buftype=nofile
	setlocal bufhidden=delete
	setlocal nobuflisted
	setlocal noswapfile
	setlocal nowrap
	setlocal filetype=shell
	setlocal syntax=shell

	call setline(1, a:cmdline)
	call setline(2, substitute(a:cmdline, '.', '=', 'g'))
	execute 'silent $read !' . escape(a:cmdline, '%#')
	setlocal nomodifiable
	1
endfunction

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }

