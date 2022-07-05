" vim: tw=0 sw=0 ts=20 noai noet

set background=dark
let g:colors_name = "white-on-black"
hi clear
if exists("syntax_on")
  syntax reset
endif

function! s:SetHighlight(name, guifg, termfg, guibg, termbg)
  let hi_command = [ "highlight", a:name,
    \ "guifg=" . a:guifg,
    \ "guisp=" . a:guifg,
    \ "ctermfg=" . a:termfg,
    \ "guibg=" . a:guibg,
    \ "ctermbg=" . a:termbg ]
  execute join(hi_command, " ")
endfunction

call s:SetHighlight("WOBWhite",	"#FFFFFF", 15,	"NONE", "NONE")
call s:SetHighlight("WOBBlack",	"#000000", 00,	"NONE", "NONE")

hi! link	DiffAdd	WOBWhite
hi! link	DiffChange	WOBWhite
hi! link	DiffDelete	WOBWhite

hi! link	ColorColumn	WOBWhite
hi! link	FoldColumn	WOBWhite
hi! link	SignColumn	WOBWhite

hi! link	Menu	WOBWhite
hi! link	Pmenu	WOBWhite
hi! link	PmenuSel	WOBWhite
hi! link	PmenuSbar	WOBWhite

hi! link	SpellBad	WOBWhite
hi! link	SpellCap	WOBWhite
hi! link	SpellLocal	WOBWhite
hi! link	SpellRare	WOBWhite

hi! link	TabLine	WOBWhite
hi! link	TabLineSel	WOBWhite
hi! link	TabLineFill	WOBWhite

hi! link	StatusLine	WOBWhite
hi! link	StatusLineNC	WOBWhite

hi! link	Underlined	WOBWhite
hi!	Underlined	cterm=underline gui=underline
hi! link	Todo	WOBWhite
hi! link	NonText	WOBWhite
hi! link	SpecialKey	WOBWhite

hi!	Normal	guifg=#FFFFFF ctermfg=15 guibg=#000000 ctermbg=00
hi! link	NormalNC	WOBWhite

hi! link	Visual	WOBWhite
hi! link	Search	WOBWhite
hi! link	Substitute	WOBWhite
hi! link	IncSearch	WOBWhite

hi! link	Whitespace	WOBBlack
hi! link	Ignore	WOBBlack

hi! link	DiagnosticHint	WOBWhite
hi! link	DiagnosticInfo	WOBWhite
hi! link	DiagnosticWarning	WOBWhite
hi! link	DiagnosticError	WOBWhite
hi!	DiagnosticUnderlineHint	cterm=underline gui=underline guisp=#FFFFFF
hi!	DiagnosticUnderlineInfo	cterm=underline gui=underline guisp=#FFFFFF
hi!	DiagnosticUnderlineWarning	cterm=underline gui=underline guisp=#FFFFFF
hi!	DiagnosticUnderlineError	cterm=underline gui=underline guisp=#FFFFFF

hi! link	Title	WOBWhite
hi! link	MsgArea	WOBWhite
hi! link	WarningMsg	WOBWhite
hi! link	ErrorMsg	WOBWhite

hi! link	LineNr	WOBWhite
hi! link	EndOfBuffer	WOBWhite
hi! link	VertSplit	WOBWhite
hi! link	MatchParen	WOBWhite

hi! link	Comment	WOBWhite
hi! link	Constant	WOBWhite
hi! link	Function	WOBWhite
hi! link	Identifier	WOBWhite
hi! link	PreProc	WOBWhite
hi! link	Special	WOBWhite
hi! link	Statement	WOBWhite
hi! link	Type	WOBWhite
hi! link	Error	WOBWhite
