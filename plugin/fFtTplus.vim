if !has('vim9script') ||  v:version < 900
    finish
endif
vim9script
g:loaded_fFtTplus = true

var id: number

hi def link FfTtSubtle Comment

def HighligtClear(): string
    if id > 0
        id->matchdelete()
        :redraw
        id = 0
    endif
    return ''
enddef

augroup fFtTplusHighlight | autocmd!
    autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave * HighligtClear()
augroup END

# Gather locations of characters to be dimmed.
def HighligtChars(s: string): string
    var [_, lnum, col, _] = getpos('.')
    var line = getline('.')
    # Extended ASCII characters can pose a challenge if we simply iterate over
    # bytes. It is preferable to let Vim split the line by characters for more
    # accurate handling.
    var found = {}
    for ch in line->split('\zs')
        if !found->has_key(ch)
            found[ch] = 1
        endif
    endfor

    var [start, reverse] = (s =~ '\C[ft]') ? [col, false] : [col - 2, true]
    var locations = []
    var freq = {}
    var maxloc = max([100, &lines * &columns])
    for ch in found->keys()
        var loc = reverse ? line->strridx(ch, start) : line->stridx(ch, start)
        while loc != -1
            freq[ch] = freq->get(ch, 0) + 1
            if freq[ch] != v:count1
                if freq[ch] > maxloc
                    # If we encounter a super long line, there's no need to
                    # search for locations most likely to be invisible.
                    break
                endif
                locations->add([lnum, loc + 1])
            endif
            loc = reverse ? line->strridx(ch, loc - 1) : line->stridx(ch, loc + 1)
        endwhile
    endfor

    if !locations->empty()
        if id > 0
            matchdelete(id)
        endif
        id = matchaddpos('FfTtSubtle', locations, 1001)
        :redraw
    endif
    return ''
enddef

noremap <silent><expr> <Plug>(fFtTplus-f) HighligtChars('f')
noremap <silent><expr> <Plug>(fFtTplus-F) HighligtChars('F')
noremap <silent><expr> <Plug>(fFtTplus-t) HighligtChars('t')
noremap <silent><expr> <Plug>(fFtTplus-T) HighligtChars('T')
noremap <silent><expr> <Plug>(fFtTplus-esc) HighligtClear()

nnoremap f <Plug>(fFtTplus-f)f
xnoremap f <Plug>(fFtTplus-f)f
onoremap f <Plug>(fFtTplus-f)f
nnoremap F <Plug>(fFtTplus-F)F
xnoremap F <Plug>(fFtTplus-F)F
onoremap F <Plug>(fFtTplus-F)F
nnoremap t <Plug>(fFtTplus-t)t
xnoremap t <Plug>(fFtTplus-t)t
onoremap t <Plug>(fFtTplus-t)t
nnoremap T <Plug>(fFtTplus-T)T
xnoremap T <Plug>(fFtTplus-T)T
onoremap T <Plug>(fFtTplus-T)T
nnoremap <esc> <Plug>(fFtTplus-esc)<esc>
xnoremap <esc> <Plug>(fFtTplus-esc)<esc>
onoremap <esc> <Plug>(fFtTplus-esc)<esc>
