" Plugin Manager Setup
call plug#begin('~/.vim/plugged')

" UI & Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editing Enhancements
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

" LSP & Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" File Explorer & Search
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Utilities
Plug 'brooth/far.vim'

call plug#end()

" Leader Keys
let mapleader = " "
let maplocalleader = ","

" UI Settings
syntax on
set number
set relativenumber
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" Indentation
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Gruvbox Customization
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_improved_strings = 1

" Airline Configuration
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_a = '%m %Y'
let g:airline_section_b = ''
let g:airline_section_c = '%f'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Filetype Detection
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" Whitespace Cleanup
autocmd BufWritePre * :%s/\s\+$//e

" Keymaps
inoremap jk <ESC>
nnoremap <leader>ee :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>g :Rg<CR>
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap p "_dP

" CoC (Completion & Formatting)
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr> <C-Space> coc#refresh()
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx :silent! call CocAction('format')
