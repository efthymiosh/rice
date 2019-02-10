" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50  " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"** Efthymios settings **"

"Set alternative greek keymap while in insert mode.
"(ctrl + 6 to switch between keymaps)
set keymap=greek_utf-8
"set default insert keymap on startup
set iminsert=0
"set search keymap same as insert keymap
set imsearch=-1


"Force 8 colors for 88color/256color terminals. We are humans, not mantis shrimps.
if &t_Co > 2
    set t_Co=8
endif
" No annoying vim files in my folders (Enabling adds features, e.g. cross-session undos)
set noswapfile 
set noundofile
set nobackup

" Tab key shows as 4 characters, tab key inserts spaces, auto indentation 4 spaces.
set tabstop=4
set shiftwidth=4
set expandtab

" Visual menu on command autocomplete (on TAB, not Ctrl+d)
set wildmenu

" Allow for hidden buffers (buffer switching without being forced to save)
set hidden

if has("autocmd")
    " Support Format-Flowed when composing mail.
    autocmd FileType mail setlocal fo+=aw tw=72

    " When done autocompleting, close any preview windows
    autocmd CompleteDone * pclose

endif

" Enable spell checking (z= in normal mode for suggestions)
" set spell
" spellsuggest=best,10

" expand the file path to include all the subdirectories to the current
" directory
set path=.,/usr/include,**,,
" Set cute colorscheme.
colorscheme slate

" Set smart search (case sensitive only when capital letters in search phrase)
set ignorecase
set smartcase

" Set line numbering and its highlighting.
set number
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=Black gui=NONE guifg=LightGrey guibg=Black

" Set highlighting for search.
highlight Search cterm=NONE ctermfg=White ctermbg=DarkGrey gui=NONE guifg=White guibg=DarkGrey

" Set highlighting for brackets
highlight MatchParen term=bold cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=Black guibg=Yellow

" Set highlight for current line, and recolor it so it doesn't suck.
set cursorline
highlight CursorLine cterm=NONE ctermbg=NONE
highlight CursorLineNr term=bold ctermfg=Black ctermbg=Brown
