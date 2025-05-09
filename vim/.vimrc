" === Plug Setup ===
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Comment toggling
Plug 'preservim/nerdcommenter'

" Language Server + Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" === Basic Settings ===
syntax on
set number
set relativenumber
set background=dark
colorscheme gruvbox

" === Gruvbox Tweaks (Optional) ===
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_improved_strings = 1

hi Normal guibg=NONE ctermbg=NONE

" === Auto Pairs ===
" No config needed, just works

" === Nerd Commenter Settings ===
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
" Use <leader>cc to comment, <leader>cu to uncomment

" === CoC (LSP + Completion) ===
" Use tab for completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()

