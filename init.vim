" So plugins can set syntax

syntax off 

"Begin Plugs
call plug#begin()
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
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
	Plug 'jiangmiao/auto-pairs'
	Plug 'pangloss/vim-javascript'
	Plug 'leafgarland/typescript-vim'
	Plug 'lucasecdb/vim-tsx'
	Plug 'hsanson/vim-android'
	Plug 'neovim/node-host', { 'do': 'npm install' }
	Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
	Plug 'tpope/vim-surround'
	Plug 'derekwyatt/vim-scala'
call plug#end()

set hidden
set autoindent
set cindent
syntax enable 
syntax on 
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
" "colorscheme OceanicNext

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
nmap <C-s> :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:UpdateRemotePlugins<CR>

" Maps crtl c for copying to system buffer
vnoremap <C-c> "+y


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

" setup tsx to be supported for jsx auto tags as well 
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

"TSX COLORS START
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" tigris enable
let g:tigris#enabled = 1

"Youcompleteme fix
let g:ycm_global_ycm_extra_conf ='~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" ale
"" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint']
let g:ale_javascript_eslint_options='-c ~/.config/.eslintrc.json'

" Enable ale auto fix
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'jsx': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'scss': ['prettier'],
\   'graphql': ['prettier'],
\   'mdx': ['prettier'],
\}
" To have ALE run Prettier on save: 
let g:ale_fix_on_save = 1
" Prettier config
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" Better highlighting
"
syn case ignore
syn region assignment oneline matchgroup=groupkey start=/\k\+\(\s*[[:space:]=]\)\@=/ skip=/\s*=\s*/ matchgroup=groupval end=/\S.*/
syn match groupcomment "#.*$"
syn region groupsection start="{" end="}" contains=assignment,groupcomment

" Highlighting
hi! link groupcomment Comment
hi! link groupkey Type

syn match pVars /\v\(\zs.*\ze\)/ contains=pKeyword,pParam
syn match pParam /\i*\(\i*(\)\@!/ contained
syn match pKeyword /\i*\ze\s*=[^=]/ contained

let s:gradlew = escape(findfile('gradlew', '.;') . " -b " . findfile('build.gradle', '.;'), ' \')

if exists("current_compiler")
    finish
endif

if exists(":CompilerSet") != 2      " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let current_compiler = s:gradlew
execute "CompilerSet makeprg=" . s:gradlew
" copied from javac.vim + added the :compileJava bits
CompilerSet errorformat=%E:compileJava%f:%l:\ %m,%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
