
execute pathogen#infect()


call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'janko/vim-test'
call plug#end()

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
set cmdheight=2
set updatetime=300
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

set nobackup
set nowritebackup

:set tags=tags;

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
au! BufWritePost .vimrc source %

syntax enable
"let g:solarized_termcolors=256
"set t_Co=256
set background=dark
colorscheme solarized

" Fix backspace
set bs=2

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set foldmethod=indent
set foldlevel=99

set undofile
set undodir=~/.vim/undodir

:set directory=$HOME/.vim/swapfiles//

" vim airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1

" nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMouseMode=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" ctrlP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP .'
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|\.git|dist)$'

" fzf
nnoremap <C-p> :Files<Cr>
nmap <leader>a :tab split<CR>:Rg 
nmap <leader>A :tab split<CR>:Rg <C-r><C-w><CR>

" ack
"nmap <leader>a :tab split<CR>:Ack ""<Left>
"nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_preview = 1

" ale
"let g:ale_completion_enabled = 1
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver', 'gqlint']}
let g:ale_fixers = {'javascript': [], 'typescript': ['prettier']}
let g:ale_lint_delay = 1000

" git
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
