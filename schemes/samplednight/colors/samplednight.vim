" File: samplednight.vim
" Description: A flashy Vim color scheme which makes everything unreadable
" Author: MultisampledNight (multisn8)
" Last Change: 2021 April 11

""" general settings

set background=dark
let g:colors_name = "samplednight"
hi clear


""" actual colors
" the pattern can be seen as:
" 	Type		Termoptions	Termcolor		GUI color		GUI options

hi	Normal	guibg=NONE	ctermfg=LightCyan	guifg=#00ffff
hi	Comment			ctermfg=Magenta	guifg=#5f00ff
hi	Constant	term=italic	ctermfg=Green	guifg=#0ceb82	gui=italic
hi	String			ctermfg=Green	guifg=#0ceb82
hi	Special			ctermfg=LightBlue	guifg=#5f87ff
hi	Statement			ctermfg=Green	guifg=#0ceb82
hi	PreProc			ctermfg=LightBlue	guifg=#5f87ff
hi	Type		term=bold	ctermfg=LightCyan guifg=#0ceb82	gui=bold
hi	Operator			ctermfg=Green	guifg=#0ceb82
hi	Ignore			ctermfg=Black	guifg=bg
hi	Error		ctermfg=Black ctermbg=Green	guifg=#111216 guibg=#0ceb82
hi	Todo		ctermfg=Black ctermbg=Cyan	guifg=#111216 guibg=#00ffff
hi	LineNr			ctermfg=Green	guifg=#0ceb82
hi	Pmenu		ctermbg=Black ctermfg=Blue	guifg=#5f87ff guibg=bg
hi	PmenuSel	ctermbg=Black ctermfg=Cyan	guifg=#00ffff guibg=bg
hi	Title				ctermfg=Green	guifg=#0ceb82
hi	EndOfBuffer			ctermfg=Magenta	guifg=#5f00ff
hi	Whitespace			ctermfg=Magenta	guifg=#5f00ff 	gui=bold



""" links
" A large part here has been taken from the "elflord" color scheme.
"		Target		Source

hi link	Character		String
hi link	Number		String
hi link	Float			Number
hi link	Identifier		Normal
hi link	Conditional		Repeat
hi link	Label			Statement
hi link	Keyword		Statement
hi link	Exception		Statement
hi link	Include		PreProc
hi link	Define		PreProc
hi link	Macro			PreProc
hi link	PreCondit		PreProc
hi link	StorageClass	Type
hi link	Structure		Type
hi link	Typedef		Type
hi link	Tag			Special
hi link	SpecialChar		Special
hi link	Delimiter		Special
hi link	SpecialComment	Special
hi link	Debug			Special
