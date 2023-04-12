" Neotree settings
nnoremap <c-h> <cmd>Neotree toggle action=focus<CR>
nnoremap <c-j> <cmd>Neotree reveal action=focus<CR>

" Symbol Outline settings
nnoremap <c-l> <cmd>SymbolsOutline<CR>

" Fugitive settings
set diffopt+=vertical

" Telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Theme configuration

set number
set cursorline
set signcolumn=yes:1
set pumheight=10
set laststatus=3 " global status line

highlight Normal       cterm=NONE ctermfg=NONE ctermbg=NONE
highlight Search       cterm=NONE ctermfg=8    ctermbg=7
highlight MatchParen   cterm=NONE ctermfg=NONE ctermbg=4
highlight Pmenu                   ctermfg=NONE ctermbg=8

" Ruler
highlight LineNr       cterm=NONE ctermfg=7    ctermbg=NONE
highlight VertSplit    cterm=NONE ctermfg=7    ctermbg=NONE

" Selected Line
highlight CursorLine   cterm=NONE              ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=7    ctermbg=NONE

" Sign Column
highlight SignColumn   cterm=NONE ctermfg=NONE ctermbg=NONE
highlight DiffAdd      cterm=NONE ctermfg=2    ctermbg=NONE
highlight DiffChange   cterm=NONE ctermfg=3    ctermbg=NONE
highlight DiffDelete   cterm=NONE ctermfg=1    ctermbg=NONE
highlight DiffText     cterm=NONE ctermfg=NONE ctermbg=NONE

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

" Highlight
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

set noshowmode
hi StatusLine cterm=NONE
lua vim.api.nvim_set_hl(0, "LineflyNormal", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyInsert", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyVisual", { link = "WildMenu" })
lua vim.api.nvim_set_hl(0, "LineflyCommand", { link = "Search" })
lua vim.api.nvim_set_hl(0, "LineflyReplace", { link = "ErrorMsg" })
