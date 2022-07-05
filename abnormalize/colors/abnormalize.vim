" vim: tw=0 sw=0 ts=20 noai noet

set background=dark
let g:colors_name = "abnormalize"
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


call s:SetHighlight("ANHighlight",	"NONE", "NONE",	"#2B5D58", 08)
call s:SetHighlight("ANSecondary",	"#9FA8CA", 07,	"NONE", "NONE")
call s:SetHighlight("ANForeground",	"#C5CEF2", 15,	"NONE", "NONE")
call s:SetHighlight("ANBlue",	"#66E0F9", 12,	"NONE", "NONE")
call s:SetHighlight("ANCyan",	"#6AE3D6", 14,	"NONE", "NONE")
call s:SetHighlight("ANGreen",	"#8BE1B1", 10,	"NONE", "NONE")
call s:SetHighlight("ANRose",	"#FFBDCA", 09,	"NONE", "NONE")
call s:SetHighlight("ANPink",	"#FFB9E9", 13,	"NONE", "NONE")
call s:SetHighlight("ANYellow",	"#D9D086", 11,	"NONE", "NONE")

call s:SetHighlight("ANIgnore",	"NONE", "NONE",	"001E1B", 00)

hi! link	DiffAdd	ANGreen
hi! link	DiffChange	ANBlue
hi! link	DiffDelete	ANRose " tbd

hi! link	ColorColumn	ANHighlight
hi! link	FoldColumn	ANHighlight
hi! link	SignColumn	ANPink

hi! link	Menu	ANForeground
hi! link	Pmenu	ANForeground
hi! link	PmenuSel	ANHighlight
hi! link	PmenuSbar	ANForeground

hi! link	SpellBad	ANRose " tbd
hi! link	SpellCap	ANPink
hi! link	SpellLocal	ANBlue
hi! link	SpellRare	ANGreen

hi! link	TabLine	ANSecondary
hi! link	TabLineSel	ANForeground
hi! link	TabLineFill	ANIgnore

hi! link	StatusLine	ANForeground
hi! link	StatusLineNC	ANSecondary

hi! link	Underlined	ANBlue
hi!	Underlined	cterm=underline gui=underline
hi! link	Todo	ANYellow
hi! link	NonText	ANPink
hi! link	SpecialKey	ANPink

hi!	Normal	guifg=#C5CEF2 ctermfg=15 guibg=#001E1B ctermbg=00
hi! link	NormalNC	ANSecondary

hi! link	Visual	ANHighlight
hi! link	Search	ANYellow
hi! link	Substitute	ANYellow
hi! link	IncSearch	ANYellow

hi! link	Whitespace	ANIgnore
hi! link	Ignore	ANIgnore

hi! link	DiagnosticHint	ANSecondary
hi! link	DiagnosticInfo	ANGreen
hi! link	DiagnosticWarning	ANYellow
hi! link	DiagnosticError	ANRose
hi!	DiagnosticUnderlineHint	cterm=underline gui=underline guisp=#9FA8CA
hi!	DiagnosticUnderlineInfo	cterm=underline gui=underline guisp=#8BE1B1
hi!	DiagnosticUnderlineWarning	cterm=underline gui=underline guisp=#D9D086
hi!	DiagnosticUnderlineError	cterm=underline gui=underline guisp=#FFBDCA

hi! link	Title	ANCyan
hi! link	MsgArea	ANForeground
hi! link	WarningMsg	ANYellow
hi! link	ErrorMsg	ANRose

hi! link	LineNr	ANSecondary
hi! link	EndOfBuffer	ANSecondary
hi! link	VertSplit	ANSecondary
hi! link	MatchParen	ANCyan

hi! link	Comment	ANSecondary
hi! link	Constant	ANGreen
hi! link	Function	ANPink
hi! link	Identifier	ANForeground
hi! link	PreProc	ANBlue
hi! link	Special	ANForeground
hi! link	Statement	ANRose
hi! link	Type	ANCyan
hi! link	Error	ANYellow
