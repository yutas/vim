function! Irrcp()
	let l:filename = expand("%:p")
	if(match(l:filename,"/home/www/parser.*/") >= 0)
		let l:irrfilename = substitute(l:filename,"/home/www/","/home/www_mount/","")
		let l:f = readfile(l:filename)
		call writefile(l:f,l:irrfilename)
		echo "Copied to ".l:irrfilename 
	endif
endfunction
