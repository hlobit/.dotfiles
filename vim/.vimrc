" enter the current millenium
" if you use vi
if !has('nvim')
  set nocompatible
endif

" plugins
" but not too much please
"
"""""""""""""""""
call plug#begin()

" listen to the pope
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lang
" Plug 'plasticboy/vim-markdown'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'

" sugar
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'AndrewRadev/linediff.vim'
Plug 'moll/vim-bbye'
Plug 'google/vim-searchindex'

" color
Plug 'morhetz/gruvbox'

" heroic
Plug 'wikitopian/hardmode'

call plug#end()
"""""""""""""""

if !has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_contrast_light='soft'
set background=dark
colorscheme gruvbox

set mouse=a
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [[ 'relativepath' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set updatetime=100

" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**
set wildignore+=**/node_modules/**

" display all matching files when we tab complete
set wildmenu

" hard times
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" break the q habit (use Ctrl-Z instead) -> :quit is still available
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

" filetype specific
autocmd FileType * set shiftwidth=2|set expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType make setlocal noexpandtab nosmarttab
autocmd FileType python set tabstop=4|set shiftwidth=4

" you'd better have them visible
set list
set listchars=tab:>-,trail:-,nbsp:⎵

" highlight trailing whitespaces
" https://github.com/tpope/vim-sensible/issues/125
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL

" custom shortcuts
nnoremap ; :Buffers<CR>
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-k> :GFiles?<cr>
nnoremap <silent> <C-d> :Gdiff<cr>
nnoremap <silent> <C-s> :%s/\s\+$//e<cr>

"inoremap jk <esc>
"inoremap <esc> <nop>

set exrc
set secure

" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
