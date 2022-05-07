" ======= vim keybindings =======
" open-fzf              SPC .
" open-pane             SPC v
" next-pane             SPC w
" open-tab              SPC t
" next-tab              TAB
" prev-tab              SHFT TAB

" setup plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'maralla/completor.vim'
Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wincent/terminus'
Plug 'w0ng/vim-hybrid'
call plug#end()

" setup lightline
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'deus',
            \ }

" setup ctrlp
let g:ctrlp_map='<space>.'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git)$',
            \ 'file': '\v\.(exe|so|dll|zip|gz|swp|swo|png|pdf)$'
            \ }
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("t")': ['<cr>'],
            \ }

" setup completor keybindings
function! TabOrComplete() abort
    if pumvisible()
        return "\<c-n>"
    elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~? '^[[:keyword:][:ident:]]'
        return "\<c-r>=completor#do('complete')\<cr>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <tab> TabOrComplete()

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

" setup appearance
set splitbelow
set splitright
set number
set relativenumber
set cursorline
set noshowmode
set noshowcmd
set pumheight=10
set background=dark
silent! colorscheme hybrid
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
