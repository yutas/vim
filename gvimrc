" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set gfn=Droid\ Sans\ Mono\ 9
set tb=
set ghr=0
set go-=m
set go-=T
set stal=2 " turn on tabs by default
" 100-column margin
"set textwidth=100
"set cc=+1  " highlight column after 'textwidth'•

" General *********************************************************************
set anti " Antialias font

colorscheme ir_black


" Default size of window
set columns=180 
set lines=65

" Tab headings 
set gtl=%t gtt=%F

map <silent> <C-t> :tabnew<CR>
vmap <silent> <C-t> <leader-ci>
