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

" Syntax Highlighting for React
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" === Basic Settings ===
syntax on
set number
set relativenumber

" Set indentation to 2 spaces
set tabstop=2       " Number of spaces a tab appears as
set shiftwidth=2    " Number of spaces to use for autoindent
set softtabstop=2   " Number of spaces a <Tab> counts for in insert mode
set expandtab       " Convert tabs to space
set background=dark
colorscheme gruvbox

" === Gruvbox Tweaks ===
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_improved_strings = 1

let g:javascript_plugin_jsx = 1

hi Normal guibg=NONE ctermbg=NONE

" === Nerd Commenter Settings ===
let g:NERDSpaceDelims = 1
