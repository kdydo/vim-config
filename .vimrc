
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'lifepillar/vim-solarized8'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'camspiers/lens.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()

set termguicolors
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized8

set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set number
set cursorline
syntax on
set laststatus=2
set hlsearch
set incsearch
set updatetime=1000

" switch splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" save on ctrl-s
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" exit insert mode
inoremap jj <Esc>

" colorizer
let g:colorizer_auto_color = 1

" quit on ctrl-q
nmap <c-q> :q<cr>
imap <c-q> <esc>:q<cr>

" allow for the removal of characters directly after entering the edit mode
set backspace=indent,eol,start

" fzf
" map <C-p> :FZF<CR>

" ctrlp
map <C-p> :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

" NERDTree
map <C-x> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \  'gitbranch': 'fugitive#head',
      \  'filename': 'FilenameForLightline'
      \ },
      \ }

" fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gf :Gdiff<CR>
nnoremap <space>n :noh<CR>

" YCM
nnoremap <space>gd :YcmCompleter GoToDefinition<CR>
nnoremap <space>gt :YcmCompleter GoToType<CR>
nnoremap <space>gr :YcmCompleter GoToReferences<CR>
nnoremap <space>d :YcmCompleter GetDoc<CR>
nnoremap <space>r :YcmCompleter RefactorRename
nnoremap <space>f :YcmCompleter Format<CR>
nnoremap <space>o :YcmCompleter OrganizeImports<CR>
nnoremap <space>x :YcmCompleter FixIt<CR>

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

hi Search ctermbg=LightYellow
let g:NERDTreeNodeDelimiter = "\u00a0" 

let g:ale_fixers = { 'javascript': ['eslint'], 'typescript': ['tslint'] }

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

filetype plugin on

let &t_SI="\033[5 q" " start insert mode
let &t_EI="\033[1 q" " end insert mode

" ack/ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" color column 
" set colorcolumn=101

" spell checker
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
