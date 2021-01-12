" Initialize plugin system
call plug#begin('~/.vim/plugged')

" Install One Dark Theme
Plug 'joshdick/onedark.vim', {'as': 'onedark'}

" Install lightline (a 'powerline' for vim)
Plug 'itchyny/lightline.vim'

" Install 'emmet' for VIM
Plug 'mattn/emmet-vim'

" Interactive notepad
Plug 'metakirby5/codi.vim'

" Orgmode for VIM
Plug 'jceb/vim-orgmode'

" Date Handler - Orgmode Requirement
Plug 'tpope/vim-speeddating' 

" Plugins to edit markdown files
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"
" Add images from clipboard in vim
Plug 'ferrine/md-img-paste.vim', { 'for': 'markdown' } 

" Autoclose brackets
Plug 'tpope/vim-surround'

" Visual marks in Vim
Plug 'kshenoy/vim-signature'

" Add git changes support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Monitor coding time
Plug 'wakatime/vim-wakatime'

" Adds autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'edkolev/tmuxline.vim'

call plug#end()

" Vim options
set tabstop=4
set shiftwidth=4 
retab " All files should match the current settings
set noexpandtab " NOT Transforms tabs into spaces
set number
set autoindent
syntax on
set wildmenu " Enable fuzzy seach
"set autochdir! " Enable autojoin in the current directory
set clipboard=unnamedplus " Clipboard from vim also affect system clipboard
set conceallevel=2 " Shows the formating only when in the current line
set colorcolumn=80 " A rule showing a limit at 80 chars
set mouse=a " Habilitar seleção com o mouse
set noshowmode
colorscheme onedark
set laststatus=2
set fileencodings=utf-8
let mapleader=","
set nofoldenable " Disable folding in markdown files

let g:lightline = {
	\ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
 	\   'right': [ 
 	\			   [ 'clock' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ],
 	\			   [ 'lineinfo' ]]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
 	\ 'component': {
 	\	'clock': '%{strftime("%H:%M")}'
 	\ },
\}

" Codi configuration
let g:codi#interpreters = {
\ 'php': {
   \ 'bin': '/home/nathabonfim59/.config/composer/vendor/bin/psysh',
   \ 'prompt': '^\(>>>\|\.\.\.\) ',
   \ },
\ }

" Vim emmet configuration
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall " Enable just for html/css files

" Configuration to image from clipaste
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'


" Git Gutter configuration
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
    " Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
    " Update sign column every quarter second
set updatetime=250
    " Jump between git chunks
nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

    " Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)

" Vim fugive configuration
nnoremap <Leader>gb :Gblame<CR>  " git blame

" Coc tab completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
" Coc Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Open coc-explorer with the same shortcut <Ctrl + Alt + b>
noremap <C-b> :CocCommand explorer<CR>

" CoC explorer config 
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
