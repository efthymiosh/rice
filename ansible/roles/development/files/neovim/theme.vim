" LineFly
set noshowmode
hi StatusLine cterm=NONE
lua vim.api.nvim_set_hl(0, "LineflyNormal", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyInsert", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyVisual", { link = "WildMenu" })
lua vim.api.nvim_set_hl(0, "LineflyCommand", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyReplace", { link = "ErrorMsg" })

" Neotree settings
nnoremap <c-h> <cmd>Neotree toggle action=focus<CR>
nnoremap <c-k> <cmd>Neotree reveal action=focus<CR>

" Symbol Outline settings
nnoremap <c-l> <cmd>SymbolsOutline<CR>

" Fugitive settings
set diffopt+=vertical

" Telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trouble settings
nnoremap <c-j> <cmd>TroubleToggle<CR>

" Theme configuration

set number
set cursorline
set signcolumn=yes:1
set pumheight=10
set laststatus=3 " global status line

hi SpecialKey     ctermfg=4
hi TermCursor     cterm=reverse
hi NonText        ctermfg=12
hi Directory      ctermfg=4
hi ErrorMsg       ctermfg=15 ctermbg=1
hi IncSearch      cterm=reverse
hi MoreMsg        ctermfg=2
hi ModeMsg        cterm=bold
hi Question       ctermfg=2
hi Title          ctermfg=5
hi WarningMsg     ctermfg=1
hi WildMenu       ctermfg=0 ctermbg=11
hi Conceal        ctermfg=7 ctermbg=7
hi SpellBad       ctermbg=9
hi SpellRare      ctermbg=13
hi SpellLocal     ctermbg=14
hi PmenuSbar      ctermbg=8
hi PmenuThumb     ctermbg=0
hi TabLine        cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel     cterm=bold
hi TabLineFill    cterm=reverse
hi CursorColumn   ctermbg=7
hi CursorLine     cterm=underline
hi MatchParen     ctermbg=14
hi Constant       ctermfg=1
hi Special        ctermfg=5
hi Identifier     cterm=NONE ctermfg=6
hi Statement      ctermfg=3
hi PreProc        ctermfg=5
hi Type           ctermfg=2
hi Underlined     cterm=underline ctermfg=5
hi Ignore         ctermfg=15
hi Error          ctermfg=15 ctermbg=9
hi Todo           ctermfg=0 ctermbg=11


" In diffs, added lines are green, changed lines are yellow, deleted lines are
" red, and changed text (within a changed line) is bright yellow and bold.
hi DiffAdd        ctermfg=0    ctermbg=2
hi DiffChange     ctermfg=0    ctermbg=3
hi DiffDelete     ctermfg=0    ctermbg=1
hi DiffText       ctermfg=0    ctermbg=11   cterm=bold

" Invert selected lines in visual mode
hi Visual         ctermfg=NONE ctermbg=NONE cterm=inverse

" hi search matches in black, with a yellow background
hi Search         ctermfg=0    ctermbg=11

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
hi LineNr       ctermfg=8
hi CursorLineNr ctermfg=7
hi Comment      ctermfg=8
hi ColorColumn  ctermfg=7    ctermbg=8
hi Folded       ctermfg=7    ctermbg=8
hi FoldColumn   ctermfg=7    ctermbg=8
hi Pmenu        ctermfg=NONE ctermbg=8
hi PmenuSel     ctermfg=8    ctermbg=15   cterm=NONE
hi PmenuThumb   ctermfg=8    ctermbg=8    cterm=NONE
hi PmenuSbar    ctermbg=7
hi SpellCap     ctermfg=7    ctermbg=8
hi StatusLine   ctermfg=15   ctermbg=8    cterm=NONE
hi StatusLineNC ctermfg=7    ctermbg=8    cterm=NONE
hi VertSplit    ctermfg=7    ctermbg=8    cterm=NONE
hi SignColumn                ctermbg=8

hi link DimFzfFg     Normal
hi link DimFzfBg     Normal
hi link DimFzfFgPlus PmenuSel
hi link DimFzfBgPlus PmenuSel
hi link DimFzfInfo   Comment

hi DimFzfHl      ctermfg=2
hi DimFzfPrompt  ctermfg=12
hi DimFzfPointer ctermfg=1
hi DimFzfMarker  ctermfg=9

let g:fzf_colors = { 'fg':      ['fg', 'DimFzfFg'],
                   \ 'bg':      ['bg', 'DimFzfBg'],
                   \ 'hl':      ['fg', 'DimFzfHl'],
                   \ 'fg+':     ['fg', 'DimFzfFgPlus'],
                   \ 'bg+':     ['bg', 'DimFzfbgPlus'],
                   \ 'hl+':     ['fg', 'DimFzfHl'],
                   \ 'info':    ['fg', 'DimFzfInfo'],
                   \ 'prompt':  ['fg', 'DimFzfPrompt'],
                   \ 'pointer': ['fg', 'DimFzfPointer'],
                   \ 'marker':  ['fg', 'DimFzfMarker']}

hi Normal       cterm=NONE ctermfg=NONE ctermbg=NONE
hi Search       cterm=NONE ctermfg=8    ctermbg=7
hi MatchParen   cterm=NONE ctermfg=NONE ctermbg=8

" Ruler
hi LineNr       cterm=NONE ctermfg=7    ctermbg=NONE
hi VertSplit    cterm=NONE ctermfg=7    ctermbg=NONE

" Selected Line
hi CursorLine   cterm=NONE              ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=7    ctermbg=NONE

" Sign Column
hi SignColumn   cterm=NONE ctermfg=NONE ctermbg=NONE
hi DiffAdd      cterm=NONE ctermfg=2    ctermbg=NONE
hi DiffChange   cterm=NONE ctermfg=3    ctermbg=NONE
hi DiffDelete   cterm=NONE ctermfg=1    ctermbg=NONE
hi DiffText     cterm=NONE ctermfg=NONE ctermbg=NONE

" Telescope
hi link TelescopeBorder LineNr
hi link TelescopeNormal LineNr
hi link TelescopeMatching Constant
hi link TelescopePromptNormal CursorLine
hi link TelescopePromptPrefix Type

" Neotree
hi NeoTreeIndentMarker cterm=NONE ctermfg=8 ctermbg=NONE
hi link NeoTreeGitAdded DiffAdd
hi link NeoTreeGitConflict DiffDelete
hi link NeoTreeGitDeleted DiffDelete
hi link NeoTreeGitIgnored DiffText
hi link NeoTreeGitModified DiffChange
hi link NeoTreeGitUntracked DiffChange

" Markdown
hi link @markup.heading Title
hi link @markup.link Title
hi link @markup.link.url @string.special
hi link @markup.list Delimiter
hi @markup.strong cterm=bold ctermfg=NONE ctermbg=NONE
hi link @comment.error Todo
hi link @comment.note Todo
hi link @comment.todo Todo
hi link @comment.warning Todo
hi link @type.qualifier Statement

" General
hi Function   cterm=NONE ctermfg=3 ctermbg=NONE
hi Identifier cterm=NONE ctermfg=1 ctermbg=NONE
hi Type       cterm=NONE ctermfg=2 ctermbg=NONE
hi String     cterm=NONE ctermfg=6 ctermbg=NONE
hi Constant   cterm=NONE ctermfg=3 ctermbg=NONE
hi Statement  cterm=NONE ctermfg=5 ctermbg=NONE
hi PreProc    cterm=bold ctermfg=1 ctermbg=NONE
hi Special    cterm=NONE ctermfg=3 ctermbg=NONE
hi @field     cterm=NONE ctermfg=NONE ctermbg=NONE
hi @variable  cterm=NONE ctermfg=NONE ctermbg=NONE
hi @property  cterm=NONE ctermfg=NONE ctermbg=NONE

hi IlluminatedWordText  cterm=NONE ctermfg=NONE ctermbg=8
hi IlluminatedWordRead  cterm=NONE ctermfg=NONE ctermbg=8
hi IlluminatedWordWrite cterm=NONE ctermfg=NONE ctermbg=8
