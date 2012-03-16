call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

"------------------
"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"------------------
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size  = 1
let g:indent_guides_color_change_percent = 15
nmap <Leader>ig :IndentGuidesToggle<CR>

"------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_min_syntax_length = 3
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" :
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"---------- TagList plugin section ------------------
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50
let Tlist_Enable_Fold_Column = 0
let Tlist_Auto_Highlight_Tag = 1

"------------------------
nnoremap <F5> :GundoToggle<CR>

"-------------------------
set fileencodings=utf8,cp1251  "Настройка кодировки
set termencoding=utf-8         "Кодировка текста по умолчанию
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


"--------------------------------------------
set equalalways             "при сплите делать окна эквивалентными
set splitbelow splitright   "помещать новое окно вначале, справа

"set cursorline "cursorcolumn
set title

" The following trick is a really small one, but a super-efficient
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

set listchars=tab:‣⋅,trail:•
"set list!
nnoremap <silent> <F7> :se list!<CR>
nmap <silent> <C-n> :CommandT<CR>
imap <silent> <C-d> <Esc>ddi
nmap <silent> <C-d> dd
imap <silent> <C-s> <Esc>:w<CR>:call Irrcp()<CR>i
nmap <silent> <C-s> :w<CR>:call Irrcp()<CR>
vmap <silent> <C-d> <S-d>
imap <silent> <A-z> <Esc>ui
vmap <C-S-Tab> <gv
vmap <C-Tab> >gv
map <silent> <C-A-w> :q<CR>

map <silent> <A-f> :call PhpDocFunc()<CR>
map <silent> <A-c> :call PhpDocClass()<CR>
map <silent> <A-v> :call PhpDocVar()<CR>

" PHP IDE
nmap <F1> <Esc>:BufExplorer<cr>
vmap <F1> <esc>:BufExplorer<cr>
imap <F1> <esc>:BufExplorer<cr>

nnoremap <silent> <F3> :Grep<CR>
let Grep_Default_Options='-i -r'

" /PHP IDE



set nocompatible                        " use vim defaults
"set expandtab                           " use spaces instead of tabstops
"set smarttab                            " use shiftwidth when hitting tab instead of sts (?)
set autoindent                          " try to put the right amount of space at the beginning of a new line
set copyindent                          " copy the previous indentation on autoindenting


set nobackup                            " no backup files
set nowritebackup                       " only in case you don't want a backup file while editing
set noswapfile                          " no swap files

set showcmd                             " display incomplete commands
set number                              " show line numbers
set ruler                               " show the current row and column

set incsearch                           " do incremental searching
set hlsearch                            " hilight searches by default
set ignorecase                          " ignore case when searching
set smartcase                           " no ignorecase if Uppercase char present

set nowrap                              " by default, dont wrap lines (see <leader>w)
set showmatch                           " briefly jump to matching }] when typing

set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set history=1000                        " store lots of :cmdline history

syntax   on                             " turn syntax highlighting on by default
filetype on                             " detect type of file
filetype indent plugin on               " load indent file for specific file type

set t_RV=                               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

set scrolloff=3                         " lines to keep visible before and after cursor
set sidescrolloff=3                     " columns to keep visible before and after cursor
set sidescroll=1                        " continuous horizontal scroll rather than jumpy

set laststatus=2                        " always display status line even if only one window is visible.
set updatetime=1000                     " reduce updatetime so current tag in taglist is highlighted faster
set autoread                            " suppress warnings when git,etc. changes files on disk.

set wildmenu                            " enable ctrl-n and ctrl-p to scroll thru matches

set t_vb=                               " and don't flash the screen either (terminal anyway...

"set tags=.tags,tags;/                   " search for a tags file recursively from cwd to /
set tags=~/.vim/mytags/parser;~/.vim/mytags/parser.trunk;~/.vim/mytags/phpdaemon;

set mouse=a
set mousemodel=popup

if has("autocmd")

  " Для php заменяем все выставляем таб в 4 пробела
  "au BufRead,BufNewFile *.php,*.html,*.htm set shiftwidth=4
  "au BufRead,BufNewFile *.php,*.html,*.htm set softtabstop=4
  au BufRead,BufNewFile *.php,*.html,*.htm set filetype=php

  autocmd BufWritePre *.php,*.html,*.htm :%s/\s\+$//e

  "Если .vimrc был отредактирован подгрузить его
  autocmd! bufwritepost .vimrc source ~/.vimrc

  "перебить табуляцию на предустановленные пробелы
  "au BufReadPost * ifmodifiable | retab | endif

  "Filetypes (au = autocmd)
  au FileType helpfile set nonumber                  "no line numbers when viewing help
  au FileType helpfile nnoremap <buffer><cr> <c-]>   "Enter selects subject
  au FileType helpfile nnoremap <buffer><bs> <c-T>   "Backspace to go back

  " Automatically chmod +x Shell and Perl scripts
  au BufWritePost   *.sh             !chmod +x %

endif

let g:vo_modules_load = "checkbox:hoist"
let g:CommandTMaxHeight=20
let g:CommandTCancelMap='<Esc>'

nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
