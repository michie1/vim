set nocp

execute pathogen#infect()

filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

set nobackup
set nowritebackup

:set tags=tags;

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Finally, the command set sw=4 sets the shift width (the number of characters text is moved sideways for the shift command (<< and >>)). "
set sw=2
set ts=2 "tabspaces"
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set mouse=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif
set number
set relativenumber
set expandtab

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

"nmap <F9> \rc<bar>\rr
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
au! BufWritePost .vimrc source %
"au BufRead,BufNewFile  *.c++  set filetype=c++
"au BufRead,BufNewFile  *.h  set filetype=c++

"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

syntax enable
"let g:solarized_termcolors=256
"set t_Co=256
set background=dark
colorscheme solarized

"nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
"autocmd BufWritePost,FileWritePost *.less silent !lessc % > %:t:r.css

" Fix backspace
set bs=2

" Bij begin/eindigen vim niet vragen om sessie te openen/ op te slaan
let g:session_autosave = 'no'
let g:session_autoload = 'no'

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

set undofile
set undodir=~/.vim/undodir

:set directory=$HOME/.vim/swapfiles//

" vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMouseMode=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|\.git|dist)$'

" Elm
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0

" Vue
let g:used_javascript_libs = 'vue'
au BufRead,BufNewFile *.vue set ft=html

" ack
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_preview = 1

" ale
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver']}
let g:ale_fixers = {'javascript': []}
"let g:ale_javascript_eslint_use_global = 0
let g:ale_lint_delay = 1000

" git
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
