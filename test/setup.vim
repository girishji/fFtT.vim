vim9script

enew
var line = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'
line->setline(1)
if assert_notequal(line, getline(1)) == 0
    verbose echoerr v:errors
endif
if assert_notequal([], getmatches()) == 0
    verbose echoerr v:errors
endif

