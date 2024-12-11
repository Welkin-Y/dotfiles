set nu
set rnu
set ru
set cursorline
set et
set ts=4
set sw=4
set t_Co=256
set incsearch
set ignorecase
set smartcase
set wrap
set confirm


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=\ %r
set statusline+=%m
set statusline+=%#identifier#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=%#LineNr#
set statusline+=\ %p%%
set statusline+=\ %l:%c
set laststatus=2


hi Comment ctermfg=green
hi MatchParen ctermbg=black ctermfg=cyan
hi CursorColumn term=bold ctermfg=black ctermbg=lightcyan cterm=bold

let mapleader = " "

inoremap jk <ESC>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

nnoremap <leader>n :set invnu invrnu<CR>

" Move to window using the <ctrl> hjkl keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Clear search with <esc> (vim has bug with follows)
" nnoremap <esc> :noh<CR><esc>

" Save file
nnoremap <C-s> :w<CR><esc>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <leader>l :ls<CR>

" Better yank
noremap Y y$

" Move lines
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :<C-u>execute "'<,'>move '>+" . v:count1<cr>gv=gv
vnoremap <leader>k :<C-u>execute "'<,'>move '<-" . (v:count1 + 1)<cr>gv=gv

" Windows
nnoremap <leader>w <c-w>
nnoremap <leader>- <C-W>s
nnoremap <leader>\| <c-w>v

" Terminal (ctrl+/ -> C-_)
set termwinsize=10*200
nnoremap <leader>t :bo term<CR>
nnoremap <C-_> :bo term<CR>
tnoremap <C-_> <cmd>close!<CR>
tnoremap <ESC> <C-\><C-n>

" Clipboard
let clip = "/mnt/c/Windows/System32/clip.exe" 
if executable(clip) == 1
  augroup Clipboard
    autocmd!
    autocmd TextYankPost * if v:event.operator == 'y' && v:event.regname == '' | call system(clip, @") | endif
  augroup END
endif
