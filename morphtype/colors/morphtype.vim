" vim: tw=0 sw=0 ts=20 noai noet

set background=dark
let g:colors_name = "morphtype"
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

call s:SetHighlight("MPTForeground",	"#BACAC8", 15,	"NONE", "NONE")
call s:SetHighlight("MPTSecondary",	"#A7B7B5", 07,	"NONE", "NONE")
call s:SetHighlight("MPTTertiary",	"#92A1A0", 07,	"NONE", "NONE")
call s:SetHighlight("MPTBackground",	"NONE", "NONE",	"#1F1227", 00)
call s:SetHighlight("MPTHighlight",	"NONE", "NONE",	"#312339", 08)
call s:SetHighlight("MPTYellow",	"#FFAB1C", 11,	"NONE", "NONE")
call s:SetHighlight("MPTCyan",	"#00D5CE", 14,	"NONE", "NONE")
call s:SetHighlight("MPTViolet",	"#DFAAFF", 13,	"NONE", "NONE")
call s:SetHighlight("MPTGreen",	"#5FD73B", 02,	"NONE", "NONE")
call s:SetHighlight("MPTRed",	"#FFA4B2", 09,	"NONE", "NONE")
call s:SetHighlight("MPTBlue",	"#80C6FF", 12,	"NONE", "NONE")

call s:SetHighlight("MPTIgnore",	"#1F1227", 05,	"NONE", "NONE")


" protip: look up hl groups you don't know with :h
hi! link	DiffAdd	MPTBlue
hi! link	DiffChange	MPTCyan
hi! link	DiffDelete	MPTRed

hi! link	ColorColumn	MPTHighlight
hi! link	FoldColumn	MPTHighlight
hi! link	SignColumn	MPTViolet

hi! link	Menu	MPTTertiary
hi! link	Pmenu	MPTSecondary
hi! link	PmenuSel	MPTHighlight
hi! link	PmenuSbar	MPTTertiary

hi! link	SpellBad	MPTYellow
hi! link	SpellCap	MPTRed
hi! link	SpellLocal	MPTViolet
hi! link	SpellRare	MPTBlue

hi! link	TabLine	MPTTertiary
hi! link	TabLineSel	MPTSecondary
hi! link	TabLineFill	MPTBackground

hi! link	StatusLine	MPTSecondary
hi! link	StatusLineNC	MPTTertiary

hi! link	Underlined	MPTBlue
hi!	Underlined	cterm=underline gui=underline
hi! link	Todo	MPTCyan
hi! link	NonText	MPTViolet
hi! link	SpecialKey	MPTViolet

" fix for neovide, somehow it doesn't like Normal being linked
hi!	Normal	guifg=#BACAC8 ctermfg=15 guibg=#1F1227 ctermbg=00
hi! link	NormalNC	MPTSecondary

hi! link	Visual	MPTHighlight
hi! link	Search	MPTYellow
hi! link	Substitute	MPTYellow
hi! link	IncSearch	MPTYellow

hi! link	Whitespace	MPTIgnore
hi! link	Ignore	MPTIgnore

hi! link	DiagnosticHint	MPTTertiary
hi! link	DiagnosticInfo	MPTBlue
hi! link	DiagnosticWarning	MPTRed
hi! link	DiagnosticError	MPTYellow
hi!	DiagnosticUnderlineHint	cterm=underline gui=underline guisp=#92A1A0
hi!	DiagnosticUnderlineInfo	cterm=underline gui=underline guisp=#80C6FF
hi!	DiagnosticUnderlineWarning	cterm=underline gui=underline guisp=#FFA4B2
hi!	DiagnosticUnderlineError	cterm=underline gui=underline guisp=#FFAB1C

hi! link	Title	MPTForeground
hi! link	MsgArea	MPTForeground
hi! link	WarningMsg	MPTRed
hi! link	ErrorMsg	MPTYellow

hi! link	LineNr	MPTTertiary
hi! link	EndOfBuffer	MPTTertiary
hi! link	VertSplit	MPTTertiary
hi! link	MatchParen	MPTViolet

hi! link	Comment	MPTTertiary
hi! link	Constant	MPTGreen
hi! link	Function	MPTViolet
hi! link	Identifier	MPTBlue
hi! link	PreProc	MPTYellow
hi! link	Special	MPTSecondary
hi! link	Statement	MPTRed
hi! link	Type	MPTCyan
hi! link	Error	MPTViolet
