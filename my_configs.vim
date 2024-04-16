
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"

set fileencodings=utf-8,ucs-bom,cp936,big5
set fileencoding=utf-8
set encoding=utf-8

let mapleader=","
" nmap <Leader>\ :Vex<CR>
" nmap <Leader>- :Sex<CR>
nmap <Leader>\ :vsp<CR>
nmap <Leader>- :sp<CR>

nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
imap <tab> <space><space>

nmap <C-tab> gt
nmap <C-S-tab> gT
vmap <C-tab> gt
vmap <C-S-tab> gT
imap <C-tab> gt
imap <C-S-tab> gT

highlight TabLineFill ctermfg=Grey ctermbg=DarkGrey
highlight TabLine ctermfg=LightGrey ctermbg=Grey
highlight TabLineSel ctermfg=White ctermbg=DarkGrey

vmap <Leader>.nn ^<S-i>@. <Esc>:let i=1 \| '<,'>g/\S*\./ s//\=i.'.'/ \| let i+=1 \| noh<CR>
vmap <Leader>nn <Esc>:let i=1 \| 1./ s//\=i.'.'/ \| let i+=1 \| noh<CR>

nmap <Leader>.nx ^<S-i>- [ ] <Esc>
vmap <Leader>.nx ^<S-i>- [ ] <Esc>
nmap <Leader>nx ^f[lrx

nmap <C-s> <Esc>:update<CR>
vmap <C-s> <Esc>:update<CR>
imap <C-s> <Esc>:update<CR>

nmap <C-a> <Esc>gg<s-v>G
vmap <C-a> <Esc>gg<s-v>G
imap <C-a> <Esc>gg<s-v>G


nmap <Leader>r` I`<Esc>A`<Esc>

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

" vmap <C-c> "+y


" imap <C-v> <ESC>"+pa

set noundofile
set nobackup
set noswapfile

" set relativenumber

set colorcolumn=81


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"ry set
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd
set incsearch

set nu

set shortmess=atI

set confirm

set mouse=a

filetype plugin indent on
" autocmd FileType text setlocal textwidth=78

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set autoread

set cindent

set smartindent

set background=dark

set showmatch

set foldenable
set fdm=syntax

" set fdm=manual
set foldlevelstart=99
set foldmethod=manual

nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""
set novisualbell

set laststatus=2

autocmd InsertLeave * se nocul

autocmd InsertEnter * se cul

set fillchars=vert:/

set fillchars=stl:/

set fillchars=stlnc:/

"my script
if has("vms")
  set nobackup
else
  set nobackup
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"  "set guioptions-=L " 
"  "set guioptions-=r " 
"  "set guioptions-=b " 
"  "set showtabline=0 " 

map <F3> :NERDTreeToggle<CR>


" autocmd VimEnter * NERDTree

let NERDTreeWinPos="left"

let NERDTreeShowBookmarks=0

let NERDTreeIgnore=['\.onetoc2$', '\~$']

let NERDTreeNaturalSort=1

let NERDTreeShowLineNumbers=1


"-- Tabularize
if exists(":Tabularize")
    nmap <Leader>tt :Tabularize /\|<CR>
    vmap <Leader>tt :Tabularize /\|<CR>
    nmap <Leader>ta :Tabularize /
    vmap <Leader>ta :Tabularize /
    nmap <Leader>tl F\|llvf\|hhr-f\|l
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

"-- ctags
set tags=tags
set autochdir

"-- Tagbar

"-- markdown2ctags

"close bell
"set nu
"set vb
"set noeb
"set noerrorbells
"set novb
"set vb t_vb=
set vb t_vb=
au GuiEnter * set t_vb=

" -- iamcco/markdown-preview.vim
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview       
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview        
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview    
"where is python?
" set pythonthreedll="C:\codedomain\environment\Python\Python37\python37.dll"
" set pythonthreedll=/c/Program\ Files/Python38/python38.dll

" --vim-markdown
let g:vim_markdown_override_foldtext = 0

let g:tex_conceal = ""
let g:vim_markdown_math = 1


" --vim-markdown-toc
let g:vmt_cycle_list_item_markers = 1

