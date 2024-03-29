" ========= keybindings =========
" open-tree             SPC f
" open-fzf              SPC .
" open-pane             SPC v
" next-pane             SPC w
" open-tab              SPC t
" next-tab              TAB
" prev-tab              SHFT TAB
" comment               gc
" search                s**
" ========= keybindings =========

" setup plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'maralla/completor.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'
Plug 'wincent/terminus'
Plug 'sainnhe/sonokai'
call plug#end()

" setup lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

" setup fern
let g:fern#disable_default_mappings = 1
noremap <silent><space>f :Fern . -drawer -reveal=% -toggle<cr><c-w>=
function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
  nmap <buffer> <cr> <Plug>(fern-action-open:tabedit)
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" setup ctrlp
let g:ctrlp_map = '<space>.'
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git)$',
      \ 'file': '\v\.(exe|so|dll|zip|gz|swp|swo|png|pdf)$'
      \ }
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("t")': ['<cr>'],
      \ }

" setup completor keybindings
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" setup general keybindings
nnoremap <silent><space>v :vs<cr>
nnoremap <silent><space>w <c-w><c-w>
nnoremap <silent><space>t :tabe<cr>
nnoremap <silent><tab> :tabn<cr>
nnoremap <silent><s-tab> :tabp<cr>
nnoremap <silent><c-e> 8<c-e>
nnoremap <silent><c-y> 8<c-y>
vnoremap <silent><c-e> 8<c-e>
vnoremap <silent><c-y> 8<c-y>
nnoremap <silent>d "_d
vnoremap <silent>d "_d

" setup ui
set splitbelow
set splitright
set number
set relativenumber
set cursorline
set noshowmode
set noshowcmd
set pumheight=10
set background=dark
filetype plugin indent on

" setup spacing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
augroup filetype tex
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

" fix backspace on mac
set backspace=indent,eol,start

" use system clipboard
set clipboard=unnamed

" setup colorscheme
let g:sonokai_show_eob = 0
let g:sonokai_better_performance = 1
let g:sonokai_disable_italic_comment = 1
silent! colorscheme sonokai
