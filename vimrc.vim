set nocp

execute pathogen#infect()
filetype plugin on

filetype plugin indent on

set nobackup
set nowritebackup

:set tags=tags;

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Finally, the command set sw=4 sets the shift width (the number of characters text is moved sideways for the shift command (<< and >>)). "
set sw=4
set ts=4 "tabspaces"
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set mouse=a
set number
set relativenumber

:ca W w

map th :tabprev<CR>
map tl :tabnext<CR>
map tt :tabedit<Space>
map tq :tabn<Space>
map t1 :tabn 1<CR>
map t2 :tabn 2<CR>
map t3 :tabn 3<CR>
map tn :tabn<Space>
map td :tabclose<CR>

"nmap <F9> !g++ % && ./a.out
"nmap <F9> :w<bar>!g++ echo % && ./a.out
"nmap <F9> :g++ % && ./a.out

"nmap <F9> \rc<bar>\rr
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
au! BufWritePost .vimrc source % 
"au BufRead,BufNewFile  *.c++  set filetype=c++
"au BufRead,BufNewFile  *.h  set filetype=c++

"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

"row width"
"set tw=80
"set wrap

"colorscheme oceandeep
"colorscheme baycomb
"colorscheme two2tango

"colorscheme ir_black
"colorscheme hemisu
"colorscheme solarized
syntax enable
"let g:solarized_termcolors=256
"set t_Co=256
set background=dark
colorscheme solarized
"colorscheme base16-default
"colorscheme flattown

"colorscheme PaperColor
"let base16colorspace=256


" coffeescript
autocmd BufWritePost,FileWritePost *.coffee silent !coffee -c -b <afile> 2>/dev/null
" autocmd BufWritePost,FileWritePost *.coffee silent !coffee -c <afile>

"nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
autocmd BufWritePost,FileWritePost *.less silent !lessc % > %:t:r.css

" Fix backspace
set bs=2

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%71v.\+/

" replaces cout by std::cout
iab cout  std::cout
iab endl std::endl

" Bij begin/eindigen vim niet vragen om sessie te openen/ op te slaan
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Troep bij begin weghalen ;2R^[[>1:2802;0c
"autocmd VimEnter * redraw!

" no files in list vim-startify
let g:startify_files_number = 0
let g:startify_enable_special = 0

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"http://stackoverflow.com/questions/908269/opening-ctags-in-new-tab-in-gvim
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

set foldmethod=indent
set foldlevel=99 

"insert } after {
"autocmd filetype cpp,c inoremap {<CR> {<CR>}<Esc>O

" use English spell checker
" set spelllang=en_us
"cabbrev spell setlocal spell spelllang=en_us
"cabbrev nospell setlocal nospell

set undofile
set undodir=~/.vim/undodir

map <C-n> :NERDTreeToggle<CR>
let NERDTreeMouseMode=2
:set directory=$HOME/.vim/swapfiles//


" vim airline
set laststatus=2
let g:airline_powerline_fonts = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exe = 'python3'
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_javascript_checkers = ['jshint']

let NERDTreeMouseMode=2

map <Leader>n <plug>NERDTreeTabsToggle<CR>
