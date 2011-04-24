silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

set nocompatible	

set autochdir	
set incsearch	
set ignorecase	
set smartcase	

set tags+=../tags,../../tags,../../../tags,../../../../tags,tmp/tags

set lazyredraw
set list
set listchars=tab:>-,trail:-
set number

set background=dark
filetype plugin indent on
syntax on

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%{exists('*rails#statusline')?rails#statusline():''}%{exists('*fugitive#statusline')?fugitive#statusline():''}%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*%=%-16(\ %l,%c-%v\ %)%P

" 12 messages and info

set showcmd
set showmode
set ruler
set visualbell

" 14 editing text

set textwidth=80
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set showmatch

" 15 tabs and indenting

set tabstop=4
set shiftwidth=4
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

colorscheme vividchalk
set grepprg=ack

" Autocommands

augroup RUBY
  autocmd!
  autocmd BufNewFile,BufRead */spec/**/*.rb,*_spec.rb compiler rspec " set the rspec compiler
  autocmd BufNewFile,BufRead */test/**/*.rb,*_test.rb compiler rubyunit " set the test unit compiler
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " use rubycomplete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby       set fdm=syntax fdl=99 " fold based on syntax, default fully open
  autocmd FileType ruby       set tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" SuperTab

let g:SuperTabDefaultCompletionType = "context"

" ragtag

let g:ragtag_global_maps = 1

" Mappings
let mapleader=","
let g:mapleader=","

nmap <Leader>n :NERDTreeToggle<CR>

nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>ff :FufFile<CR>

nmap <Leader>tl :TlistToggle<CR>

nmap <Tab> :R<CR>
nmap <C><Tab> :A<CR>

nmap <Leader>bd :bd<CR>
