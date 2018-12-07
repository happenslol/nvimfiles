set rtp+=~/nvimfiles

call plug#begin('~/nvimfiles/plugs')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'dikiaap/minimalist'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'mattn/emmet-vim'

Plug 'happenslol/csfind.vim'
Plug 'w0rp/ale'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" Colorscheme
set background=dark
colorscheme minimalist

let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline = 1
let g:airline#extensions#ale#enabled = 1
let g:Powerline_symbols = 'fancy'

" Use relative line numbers
set number
set relativenumber
set numberwidth=4
hi LineNr guibg=black
hi LineNr ctermfg=black ctermbg=black

set mouse=a

set undofile
set undodir=~/nvimfiles/undo//
set directory=~/nvimfiles/swap//

" Enhance command-line completion
set wildmenu
" Allow backspace in ins mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=','
" Don't add empty newlines at the end of files
set binary
set noeol
" Make sure vim history works
set viminfo+=!
" Reduce splits to a single line
set wmh=0
" Enable syntax highlighting
syntax on
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show last status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don't reset cursor to start of line when moving around
set nostartofline
" show the cursor position
set ruler
" Don't show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the windows title bar
set title
" Show the (partial) command as it's being typed
set showcmd
" Start scrolling five lines before the horizontal window border
set scrolloff=3

" Map NERDTree to ctrl-n
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'ts', 'css', 'scss', 'json', 'html', 'png', 'svg']

" Map fzf bindings
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :History<CR>

" custom keybinds
nnoremap <C-f>l :cnext<CR><CR> 
nnoremap <C-f>h :cprev<CR><CR> 
nnoremap <C-f>k :copen<CR>
nnoremap <C-f>j :cclose<CR>

map <F2> :nohl<CR>

" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Set tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Customize fzf colors to match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

fun! RefreshAll()
    set noconfirm
    bufdo e!
    set confirm
endfun

map <leader>r :silent call RefreshAll()<CR>

nnoremap <A-f> :CsfPrompt<CR>

let g:go_fmt_command = "goimports"

let g:user_emmet_leader_key = '<C-l>'
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
set completeopt-=preview
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>q :ALEHover<CR>

com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
hi clear SignColumn
