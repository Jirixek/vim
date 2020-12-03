" Disable Caps Lock when leaving Insert or CommandLine mode
function TurnOffCaps()
	let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
	if capsState == 'on'
		silent! execute ':!xdotool key Escape'
	endif
endfunction

" Delete trailing spaces at the end of a line and under the document
function DeleteTrailingSpace()
	let l:save_view = winsaveview()
	%substitute/\s\+$//e
	silent! $global /^$/ normal "_dip
	call winrestview(l:save_view)
endfunction

augroup vimrc
	autocmd!

	" Automatically delete all trailing whitespace
	autocmd BufWritePre * call DeleteTrailingSpace()

	" Manage Capslock
	autocmd InsertLeave * call TurnOffCaps()
	autocmd CmdlineLeave * call TurnOffCaps()
augroup end
