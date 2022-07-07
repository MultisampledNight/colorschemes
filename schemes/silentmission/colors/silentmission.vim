" File: silentmission.vim
" Description: A Vim colorscheme trying to be balanced while remaining calm
" Author: MultisampledNight (multisn8)
" vim:tw=80 ts=16 shiftwidth=16 autoindent noexpandtab:

set background=dark
let g:colors_name = "silentmission"
hi clear

function! s:SetHighlight(name, guicolor, termcolor)
  let hi_command = [ "highlight", a:name,
    \ "guifg=" . a:guicolor,
    \ " ctermfg=" . a:termcolor ]
  execute join(hi_command, " ")
endfunction

call s:SetHighlight("SMViolet",		"#A545F5",	13)
call s:SetHighlight("SMBlue",		"#14C0CC",	14)
call s:SetHighlight("SMGreen",		"#15E787",	10)
call s:SetHighlight("SMYellow",		"#FFE45F",	11)
call s:SetHighlight("SMRed",		"#F0294C",	9)
call s:SetHighlight("SMBrown",		"#C26523",	1)
call s:SetHighlight("SMGrey",		"#A2A2A2",	8)
call s:SetHighlight("SMHighlight",	"#1C1C1C",	7)
call s:SetHighlight("SMForeground",	"#FFFBFB",	15)
call s:SetHighlight("SMBackground",	"#0A0A0A",	0)

hi!	Normal	guifg=#FFFBFB	guibg=NONE
hi!	Visual		guibg=#1C1C1C		ctermbg=7
hi!	VisualNOS		guibg=#1C1C1C		ctermbg=7

hi! link	DiffAdd	SMGreen
hi! link	DiffChange	SMBlue
hi! link	DiffDelete	SMRed
hi! link	DiffText	SMViolet
hi! link	Folded	SMGrey
hi! link	LineNr	SMGrey
" like the ~ at empty lines at the end of the buffer
hi! link	NonText	SMGrey
hi! link	QuickFixLine	SMBlue
hi! link 	Search	SMYellow
hi! link	SignColumn	SMGrey
hi! link	SpecialKey	SMYellow
hi! link	Substitute	SMYellow

hi! link	Pmenu	SMGrey
hi! link	PmenuSel	SMForeground
hi! link	PmenuSbar	SMForeground

hi! link	SpellBad	SMRed
hi! link	SpellCap	SMBrown
hi! link	SpellLocal	SMBlue
hi! link	SpellRare	SMBlue

hi! link	MsgArea	SMForeground
hi! link	ErrorMsg	SMRed
hi! link	WarningMsg	SMYellow
hi! link	Question	SMGreen
hi! link	StatusLine	SMGreen
hi! link	StatusLineNC	SMGrey
hi! link	Title	SMYellow

hi! link	Menu	SMForeground
hi! link	Scrollbar	SMForeground
hi! link	Tooltip	SMForeground


" Actual Syntax Highlighting
hi! link	Type	SMBlue
hi! link	StorageClass	SMBlue
hi! link	String	SMYellow

hi! link	Comment	SMGrey
hi! link	SpecialComment	SMRed
hi! link	Error	SMRed
hi! link	Constant	SMViolet
hi! link	Identifier	SMForeground
hi! link	Function	SMGreen
hi! link	Macro	SMBrown
hi! link	Include	SMBlue
hi! link	Keyword	SMRed
hi! link	Operator	SMRed
hi! link	PreProc	SMBrown
hi! link	Special	SMGrey
hi! link	Todo	SMGreen

hi! link	Structure	Type
hi! link	TypeDef	Type

hi! link	Statement	Keyword
hi! link	Conditional	Keyword
hi! link	Float	String
hi! link	Number	String
hi! link	Boolean	String

hi! link	Ignore	SMBackground

