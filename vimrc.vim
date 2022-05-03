call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'oguzbilgic/vim-gdiff'
"Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
"Plug 'lighttiger2505/sqls.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/async.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-exchange'
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
set tabstop=4
set shiftwidth=4
set expandtab
set cmdheight=2
set updatetime=300
:ca W w
" :map! <F1> <ESC>:w<CR>
" :map! <ESC><ESC> <ESC>:w<CR>
:inoremap WW <Esc>:w<CR>
:noremap WW :w<CR>
"nnoremap W :w<cr>

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

nnoremap <silent> <leader>c :!git checkout -p %<cr> <bar> <cr> <bar> :edit<cr>
nnoremap <silent> <leader>a :!git add -p %<cr> <bar> <cr>

"""" buffers
nnoremap fl :bn<cr>
nnoremap fh :bp<cr>
nnoremap fd :bd<cr>
nnoremap f; :bd<bar>bn<cr>
nnoremap ff :Buffers<cr>
nnoremap fp :Files<Cr>

nnoremap H :History<cr>


"""""" coc
set hidden

let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier']

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

nmap <silent> gg <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references-used) 
"nmap <silent> gr <Plug>(coc-references) 
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>ac  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>rr  <Plug>(coc-refactor)
"nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <leader>d  :<C-u>CocList diagnostics<cr>
"nnoremap <silent> <space>f  :<C-u>CocCommand tsserver.executeAutofix<cr>
nnoremap <leader>f  :<C-u>CocCommand tsserver.executeAutofix<cr>
"""<bar> :edit<cr>
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
"nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <silent> [d :call CocAction('diagnosticNext')<cr>
nmap <silent> ]d :call CocAction('diagnosticPrevious')<cr>

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add empty props to React component
"nmap <leader>ap 0f(bvt(yOtype<space><ESC>pAProps = {}<ESC>j0f(a{}:<space><ESC>paProps<ESC>

" Run visual text for current file
"command! -nargs=0 VT :silent execute '!BASH_POST_RC="yarn test:visual:update '. substitute(expand('%:t'), '.fixture.tsx', '', 'g') .'" gnome-terminal &'

" Test current file
nmap <silent> yt :silent !BASH_POST_RC='npm run test % -- -- --watch' gnome-terminal<cr><cr>

" open spec file
nmap <leader>t :execute 'edit ' . system('find . -name ' . expand('%:t:r') . '.spec.ts')<CR>

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
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <c-space> coc#refresh()


" Show current selected word highlighted in rest of buffer
 autocmd CursorHold * silent call CocActionAsync('highlight')

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"command! -nargs=0 Prettier2 :!yarn prettier --write % <CR><CR>




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

" Select data from the selected table.
nmap <leader>pd :VipsqlShell <CR>select * from <C-r><C-w>;<CR>

source ~/.vim/psql-settings.vim
" let g:omni_sql_no_default_maps = 1

" reverse search to it(|it.only(|it.skip(
"nmap <leader>o ?it(<CR>ct(it.only<ESC><C-o>
"nmap <leader>o ?it(<CR>:s/it(/it.only(/ge<CR>:s/it.skip(/it.only(/ge<CR>2<C-o>
":help keeppattern does not store the search
nmap <leader>o :keepp /^it<CR>:keepp ?^it<CR>:keepp :s/it(/it.only(/ge<CR>:keepp :s/it.skip(/it.only(/ge<CR>
nmap <leader>i :keepp /^it<CR>:keepp ?^it<CR>:keepp :s/it.only(/it(/ge<CR>:keepp :s/it.skip(/it(/ge<CR>
nmap <leader>s :keepp /^it<CR>:keepp ?^it<CR>:keepp :s/it(/it.skip(/ge<CR>:keepp :s/it.only(/it.skip(/ge<CR>
" Keep last position with bookmarks?

nmap <leader>l iconsole.log(

command! -count=1 HFiles call fzf#run({ 'source': 'git log HEAD -n <count> --diff-filter=MA --name-only --pretty=format: | sed -e /^$/d'})

" Disable floating window
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }
"let g:fzf_layout = { 'down': '40%' }


" https://www.reddit.com/r/vim/comments/gv410k/strange_character_since_last_update_42m/
let &t_TI = ""
let &t_TE = ""

"FWIW :Glog -g stash loads all stashes to the quickfix list. You can then browse them and apply using cz<Space>apply<Space><C-R><C-G>

" https://stackoverflow.com/questions/178257/how-to-avoid-syntax-highlighting-for-large-files-in-vim
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
