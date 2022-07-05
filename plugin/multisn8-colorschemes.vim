let s:plug_dir = expand("<sfile>:p:h:h") . "/"
for folder in readdir(s:plug_dir, { item -> isdirectory(item) || item !=? "plugin" })
	execute "set runtimepath+=" . s:plug_dir . folder
endfor
