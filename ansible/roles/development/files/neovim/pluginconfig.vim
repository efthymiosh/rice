" load lua-based configuration
lua require('plugins')

" Neotree settings
nnoremap <c-h> :Neotree toggle action=focus<CR>

" Symbol Outline settings
nnoremap <c-l> :SymbolsOutline<CR>

" Fugitive settings
set diffopt+=vertical

" Telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coc.nvim settings
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-rust-analyzer',
    \ 'coc-lua',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-groovy',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-yaml',
    \ 'coc-toml',
\]
set updatetime=750
set shortmess+=c
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Theme configuration
colorscheme dim

set number
set cursorline
set signcolumn=yes:1

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

" Coc
hi CocMenuSel  cterm=NONE ctermfg=0 ctermbg=4
hi CocListLine cterm=NONE ctermfg=0 ctermbg=7
hi CocFloating cterm=NONE ctermfg=0 ctermbg=7

hi CocUnderline cterm=NONE ctermfg=NONE ctermbg=NONE
hi CocHighlightText cterm=NONE ctermfg=NONE ctermbg=8
hi CocUnusedHighlight cterm=NONE ctermfg=NONE ctermbg=8

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
