set guicursor=n-v-c-i:block
set notermguicolors
syntax on

lua require('plugins')
execute 'source ' . stdpath("config") . "/theme.vim"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=2000 " lines of command line history to keep
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch    " do incremental searching

set keymap=greek_utf-8 " keymaps: add greek, defaults
set iminsert=0
set imsearch=-1

" No annoying vim files in my folders (Enabling adds features, e.g. cross-session undos)
set noswapfile
set noundofile
set nobackup
set nowritebackup

" Tab key shows as 4 characters, tab key inserts spaces, auto indentation 2 spaces.
set tabstop=4
set shiftwidth=2
set expandtab

" Set smart search (case sensitive only when capital letters in search phrase)
set ignorecase
set smartcase

if has("autocmd")
    " Support Format-Flowed when composing mail.
    autocmd FileType mail setlocal fo+=aw tw=100
    " Markdown configuration
    autocmd FileType markdown setlocal tw=100
    " Per-language indentation configuration
    autocmd FileType go   setlocal shiftwidth=4 noexpandtab
    autocmd FileType java setlocal shiftwidth=4
    " When done autocompleting, close any preview windows
    autocmd CompleteDone * pclose
    " some ansible/jinja2 template overrides
    autocmd BufNewFile,BufRead *.yaml.*        set filetype=yaml
    autocmd BufNewFile,BufRead *.yml.*         set filetype=yaml
    autocmd BufNewFile,BufRead *.json.*        set filetype=json
    autocmd BufNewFile,BufRead *.properties.*  set filetype=jproperties
    autocmd BufNewFile,BufRead *.service.*     set filetype=systemd
    autocmd BufNewFile,BufRead *.conf.*        set filetype=conf
endif

" Don't fill unused lines with tildes :`)
lua vim.o.fillchars='eob: '

set path=.,/usr/include,**,,
