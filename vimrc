scriptencoding utf-8
set encoding=utf-8

execute pathogen#infect()

set nocompatible

set autochdir
set incsearch
set ignorecase
set smartcase

set tags+=../tags,../../tags,../../../tags,../../../../tags,tmp/tags,~/.vim/tags/*

set list
set listchars=tab:→\ ,trail:-
set number

set background=dark
" syntax on
syntax enable
filetype plugin indent on

set cursorcolumn

set laststatus=2 " Always display the statusline in all windows
set showtabline=1 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" 12 messages and info

set showcmd
set showmode
set ruler
set visualbell

" 14 editing text

set backspace=indent,eol,start
set completeopt=menu,longest,preview
set showmatch

" 15 tabs and indenting

set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent

" 19 reading and writing files

set autowrite
set autoread

" 20 the swap file

set directory=~/.vim/swap

" 21 command line editing

set wildignore=*.o,*.obj,*.tmp,*.sw[op],*rbc,*pyc,~*
set wildignorecase
set wildmenu
set undofile
set undodir=~/.vim/undo

" XX other stuff

set conceallevel=2

" colorscheme vividchalk
colorscheme solarized
set grepprg=ack

function! PrepareRebaseCommitMessage()
	" Remove comments
	silent! 1,/# Please enter the commit message for your changes./-1g/^#/d

	" Remove empty lines
	silent! 1,/# Please enter the commit message for your changes./-1g/^$/d

	" Turn the previous commit messages in to list items
	silent! 1,/# Please enter the commit message for your changes./-1g!/^$/exe "normal! I* \<ESC>"

	silent! normal gg[ [ gg
endfunction

" Autocommands

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec " set the rspec compiler
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit " set the test unit compiler
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " use rubycomplete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby compiler ruby
  autocmd FileType cucumber,haml,sass,ruby,eruby setlocal textwidth=75 formatoptions+=t
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby       set fdm=syntax fdl=99 " fold based on syntax, default fully open
  autocmd FileType ruby       set tabstop=2 shiftwidth=2 softtabstop=2 et
  autocmd FileType cucumber   set tabstop=2 shiftwidth=2 softtabstop=2 et
augroup END

autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd FileType coffee     set tabstop=2 shiftwidth=2 softtabstop=2 et
autocmd FileType python     set et
autocmd FileType c          set tabstop=4 shiftwidth=4 softtabstop=4 et
autocmd FileType asm        set tabstop=4 shiftwidth=4 softtabstop=4 et
autocmd FileType yaml       set tabstop=2 shiftwidth=2 softtabstop=2 et
autocmd FileType haskell    set et
autocmd FileType java       set tabstop=2 shiftwidth=2 softtabstop=2 et

autocmd BufReadPost gitcommit call PrepareRebaseCommitMessage()


" SuperTab

let g:SuperTabDefaultCompletionType = "context"

" ragtag

let g:ragtag_global_maps = 1

" Mappings
let mapleader=","
let g:mapleader=","

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeToggle %<CR>

nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>ff :FufFile<CR>

nmap <Leader>tl :TlistToggle<CR>

nmap <Tab> :R<CR>
nmap <C-Tab> :A<CR>

nmap <Leader>bd :bd<CR>

nmap <Leader>tb :TagbarOpenAutoClose<CR>

" Functions
function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !google-chrome \"".a:url."\""
  else
    exe "silent !google-chrome -T \"".a:url."\""
  endif
  redraw!
endfunction

command! -nargs=1 OpenURL :call OpenURL(<q-args>)

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let ruby_operators = 1
let ruby_space_errors = 1
let g:rubycomplete_buffer_loading = 1

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

set encoding=utf-8

" syntastic recommended settings via its github page
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
