set guicursor=n-v-c-i:block

if !empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute 'source ' . stdpath("config") . "/plugins.vim"
    execute 'source ' . stdpath("config") . "/pluginconfig.vim"
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=200 " lines of command line history to keep
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

syntax on

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END
else
    set autoindent		" always set autoindenting on
endif " has("autocmd")

set keymap=greek_utf-8 " keymaps: add greek, defaults
set iminsert=0
set imsearch=-1

" No annoying vim files in my folders (Enabling adds features, e.g. cross-session undos)
set noswapfile
set noundofile
set nobackup
set nowritebackup

" Tab key shows as 4 characters, tab key inserts spaces, auto indentation 4 spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Set smart search (case sensitive only when capital letters in search phrase)
set ignorecase
set smartcase

if has("autocmd")
    " Support Format-Flowed when composing mail.
    autocmd FileType mail setlocal fo+=aw tw=100
    autocmd FileType markdown setlocal tw=100
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

" Configure Theming

set number
set cursorline
highlight Normal       cterm=NONE ctermfg=NONE ctermbg=NONE
highlight Search       cterm=NONE ctermfg=8    ctermbg=5
highlight MatchParen   cterm=NONE ctermfg=NONE ctermbg=4
highlight Pmenu                   ctermfg=0    ctermbg=7

" Ruler
highlight LineNr       cterm=NONE ctermfg=7    ctermbg=NONE
highlight VertSplit    cterm=NONE ctermfg=7    ctermbg=NONE

" Selected Line
highlight CursorLine   cterm=NONE              ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=7    ctermbg=NONE

" Don't fill unused lines with tildes :`)
lua vim.o.fillchars='eob: '

set path=.,/usr/include,**,,
