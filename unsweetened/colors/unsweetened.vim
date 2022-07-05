" Dude, you know, let's just stop with these file headers, there is a whole
" git history which keeps track of which file got written by who and when
"  vim:tw=0 sw=0 ts=20 noai noet:

set background=dark
let g:colors_name = "unsweetened"
hi clear
if exists("syntax_on")
  syntax reset
endif

function! s:SetHighlight(name, guicolor, termcolor)
  let hi_command = [ "highlight", a:name,
    \ "guifg=" . a:guicolor,
    \ "guisp=" . a:guicolor,
    \ "ctermfg=" . a:termcolor, ]
  execute join(hi_command, " ")
endfunction

function! s:SetBgHighlight(name, guicolor, termcolor)
  let hi_command = [ "highlight", a:name,
    \ "guibg=" . a:guicolor,
    \ "ctermbg=" . a:termcolor ]
  execute join(hi_command, " ")
endfunction


call s:SetHighlight("UNSBackground",	"#171c1c",	00)
call s:SetHighlight("UNSForeground",	"#b8b2b8",	08)
call s:SetHighlight("UNSRed",	"#ff4f60",	01)
call s:SetHighlight("UNSYellow",	"#fffc4f",	03)
call s:SetHighlight("UNSGreen",	"#67dc44",	02)
call s:SetHighlight("UNSCyan",	"#34dec2",	06)
call s:SetHighlight("UNSBlue",	"#4fc1ff",	04)
call s:SetHighlight("UNSMagenta",	"#c44fff",	05)
call s:SetHighlight("UNSSecondary",	"#a8a3a8",	07)
call s:SetHighlight("UNSPrimary",	"#c7c1c7",	15)
call s:SetHighlight("UNSFgHighlight",	"#333e3e",	07)

call s:SetBgHighlight("UNSHighlight",	"#333e3e",	07)
call s:SetBgHighlight("UNSImportant",	"#fffc4f",	03)


hi!	Normal	guibg=#171c1c
hi! link	Normal	UNSForeground
hi! link	NormalNC	UNSSecondary
hi! link	Ignore	UNSBackground
hi! link	Visual	UNSHighlight

hi! link	NormalFloat	Normal

hi! link	VisualNOS	Visual

hi! link	EndOfBuffer	UNSSecondary
hi! link	LineNr	UNSSecondary
hi! link	NonText	UNSFgHighlight
hi! link	SpecialKey	UNSYellow
hi! link	SignColumn	UNSSecondary
hi! link	ColorColumn	UNSHighlight
hi! link	VertSplit	UNSSecondary
hi! link	FoldColumn	UNSSecondary
hi! link	Whitespace	UNSFgHighlight
hi! link	Todo	UNSImportant
hi! link	Title	UNSPrimary
hi! link	MatchParen	UNSPrimary

hi! link	Menu	UNSPrimary
hi! link	Scrollbar	UNSSecondary
hi! link	Tooltip	UNSSecondary
hi! link	Pmenu	UNSSecondary
hi! link	PmenuSel	UNSHighlight
hi! link	PmenuSbar	UNSSecondary
hi! link	WildMenu	UNSPrimary
hi! link	StatusLine	UNSSecondary
hi! link	StatusLineNC	UNSFgHighlight
hi! link	ModeMsg	UNSSecondary

hi! link	TabLine	UNSSecondary
hi! link	TabLineSel	UNSPrimary
hi! link	TabLineFill	UNSHighlight

hi! link	IncSearch	UNSImportant
hi! link	Search	UNSImportant
hi! link	MsgArea	UNSForeground
hi! link	WarningMsg	UNSYellow
hi! link	Question	UNSMagenta
hi! link	ErrorMsg	UNSRed

hi! link	DiffAdd	UNSGreen
hi! link	DiffChange	UNSMagenta
hi! link	DiffDelete	UNSRed

hi! link	SpellBad	UNSRed
hi! link	SpellCap	UNSMagenta
hi! link	SpellLocal	UNSCyan
hi! link	SpellRare	UNSCyan

hi! link	LspDiagnosticsDefaultHint	UNSSecondary
hi! link	LspDiagnosticsDefaultInformation	UNSSecondary
hi! link	LspDiagnosticsDefaultWarning	UNSBlue
hi! link	LspDiagnosticsDefaultError	UNSGreen
hi!	LspDiagnosticsUnderlineHint	cterm=underline gui=underline guisp=#a8a3a8
hi!	LspDiagnosticsUnderlineInformation	cterm=underline gui=underline guisp=#a8a3a8
hi!	LspDiagnosticsUnderlineWarning	cterm=underline gui=underline guisp=#4fc1ff
hi!	LspDiagnosticsUnderlineError	cterm=underline gui=underline guisp=#67dc44


hi! link	Statement	UNSRed
hi! link	Error	UNSRed
hi! link	PreProc	UNSYellow
hi! link	Constant	UNSYellow
hi! link	String	UNSGreen
hi! link	Include	UNSCyan
hi! link	Type	UNSCyan
hi! link	Identifier	UNSBlue
hi! link	Function	UNSMagenta
hi! link	Comment	UNSSecondary
hi! link	Special	UNSSecondary
hi! link	Operator	UNSPrimary
hi! link	SpecialComment	UNSPrimary

hi! link	Keyword	Statement

hi! link	Macro	Preproc

hi! link	StorageClass	Type
hi! link	TypeDef	Type
hi! link	Structure	Type

hi! link	Character	String
hi! link	Number	String
hi! link	Float	String
hi! link	Boolean	String

