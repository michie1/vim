call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

execute pathogen#infect()

nnoremap <Leader>vr :source $MYVIMRC<CR>
set noswapfile

syntax on
set background=dark
colorscheme solarized
filetype plugin indent on
set mouse=a

set number
set tabstop=2
set shiftwidth=2
set expandtab
set cmdheight=2
set updatetime=300
:ca W w

set undofile
set undodir=~/.vim/undodir

map th :tabprev<CR>
map tl :tabnext<CR>
map tt :tabedit<Space>

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

nnoremap <C-p> :Files<Cr>
"nmap <leader>g :tab split<CR>:Rg 
nmap <leader>g :Rg 
"nmap <leader>G :tab split<CR>:Rg <C-r><C-w><CR>
nmap <leader>G :Rg <C-r><C-w><CR>
nmap <leader>f :BLines<Cr>
nmap <leader>F :BLines <C-r><C-w><Cr>

nnoremap <silent> <leader>c  :!git checkout -p %<cr> <bar> <cr> <bar> :edit<cr>
nnoremap <silent> <leader>a  :!git add -p %<cr> <bar> <cr>

"""" buffers
nnoremap fl :bn<cr>
nnoremap fh :bp<cr>
nnoremap fd :bd<cr>
nnoremap ff :buffers<cr>:b<space>

"""""" coc
set hidden

let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier']

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

nmap <silent> gg <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>rn  <Plug>(coc-rename)
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>f  :<C-u>CocCommand tsserver.executeAutofix<cr> <bar> :edit<cr>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

""" psql
" Opens a scratch buffer where output from psql is directed.
noremap <leader>po :VipsqlOpenSession<CR><CR>

" In visual-mode, sends the selected text to psql.
vnoremap <leader>ps :VipsqlSendSelection<CR>

" Sends the current line to psql.
noremap <leader>pl :VipsqlSendCurrentLine<CR>

" Sends the entire current buffer to psql.
noremap <leader>pb :VipsqlSendBuffer<CR>

" Sends `SIGINT` (C-c) to the psql process.
noremap <leader>pc :VipsqlSendInterrupt<CR>

source ~/.vim/psql-settings.vim
