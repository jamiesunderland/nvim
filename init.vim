set hidden
set autoindent
set cindent
syntax enable 
set wildmenu
nmap <Space> /
map <C-o> :NERDTreeToggle %<CR>

set statusline+=%#warningmsg#
set statusline+=%*
set number

" Color related stuff
" Note at start up time neovim doesn't know what directory to look in
" for colors
set background=dark
set t_Co=256 
colorscheme PaperColor

" Java highlight extendsion
let java_highlight_functions = 1
let java_highlight_all = 1

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type

let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set shiftwidth=2
set tabstop=2
set softtabstop=0 noexpandtab


" Ale linting
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Syntastic checks
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["java"] }

autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" Control P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:github_enterprise_urls = ['https://git.musta.ch']

if has("gui_vimr")
  " VimR specific stuff
endif

if has("gui_macvim")
  " MacVim specific stuff
endif

let g:move_key_modifier = 'C'

call plug#begin()
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'srcery-colors/srcery-vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'NLKNguyen/papercolor-theme' 
	Plug 'matze/vim-move'
	Plug 'artur-shaik/vim-javacomplete2'
	Plug 'tpope/vim-fugitive'
	Plug 'kien/ctrlp.vim'
	Plug 'rking/ag.vim'
	Plug 'w0rp/ale'
	Plug 'elixir-editors/vim-elixir'
	Plug 'slashmili/alchemist.vim'
call plug#end()
