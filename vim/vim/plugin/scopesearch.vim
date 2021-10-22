" Search within a scope (a {...} program block).
" Version 2010-02-28 from http://vim.wikia.com/wiki/VimTip1530

" From :help [[,
" [[          [count] sections backward or to the previous '{' in
"             the first column.  |exclusive|
"             Note that |exclusive-linewise| often applies.
" I never found the default behavior of [[ and ]] useful UNTIL I saw this tip from :help section
" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings:
" map [[ ?{<CR>w99[{
" map ][ /}<CR>b99]}
" map ]] j0[[%/{<CR>
" map [] k$][%?}<CR>

" Search within top-level block for word at cursor, or selected text.
nnoremap <Leader>[ /<C-R>=<SID>ScopeSearch('[[', 1)<CR><CR>
vnoremap <Leader>[ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>gV
" Search within current block for word at cursor, or selected text.
nnoremap <Leader>{ /<C-R>=<SID>ScopeSearch('[{', 1)<CR><CR>
vnoremap <Leader>{ <Esc>/<C-R>=<SID>ScopeSearch('[{', 2)<CR><CR>gV
" Search within current top-level block for user-entered text.
nnoremap <Leader>/ /<C-R>=<SID>ScopeSearch('[[', 0)<CR>
vnoremap <Leader>/ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>

" Return a pattern to search within a specified scope, or
" return a backslash to cancel search if scope not found.
" navigator: a command to jump to the beginning of the desired scope
" mode: 0=scope only; 1=scope+current word; 2=scope+visual selection
function! s:ScopeSearch(navigator, mode)
  if a:mode == 0
    let pattern = ''
  elseif a:mode == 1
    let pattern = '\<' . expand('<cword>') . '\>'
  else
    let old_reg = getreg('@')
    let old_regtype = getregtype('@')
    normal! gvy
    let pattern = escape(@@, '/\.*$^~[')
    call setreg('@', old_reg, old_regtype)
  endif
  let saveview = winsaveview()
  execute 'normal! ' . a:navigator
  let first = line('.')
  normal %
  let last = line('.')
  normal %
  call winrestview(saveview)
  if first < last
    return printf('\%%>%dl\%%<%dl%s', first-1, last+1, pattern)
  endif
  return "\b"
endfunction

" With the cursor inside a function, type \[ or \{ or \/ to search:
" \[
" Search for visually selected text, or the current word, but only
" within the current function ({...} with opening brace in first column).

" \{
" Search for visually selected text, or the current word, but only
" within the current block ({...}).

" \/
" Search for visually selected text, or whatever text you enter, but only
" within the current function.

" If you visually select some text then type \[ or \{ or \/, the search locates the next occurrence of the selected text, but only within the specified scope.

" If there is no selected text:

" Typing \[ or \{ searches for the word under the cursor (same as *).
" Typing \/ displays a search pattern that defines the scope. Finish the pattern by typing any desired text, then press Enter to complete the search.

" After searching, press n or N to search for the next or previous occurrence, within the same scope.

" The script uses [[ to jump to the start of the current function, or [{ to jump to the start of the current block. That should place the cursor on a left brace. Then % is used to jump to the matching right brace. The numbers of the lines holding the left and right braces define the scope. In case no block is detected, the script returns "\b" (a backspace character) which cancels the search that was started by the mapping.
