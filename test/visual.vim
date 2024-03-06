vim9script

so ./setup.vim

# Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

cursor(1, 20)
norm vfc"ay
'a'->getreg()
if assert_notequal('it amet, c', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm vto"ay
'a'->getreg()
if assert_notequal('it amet, c', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm vTp"ay
if assert_notequal('sum dolor si', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm vFi"ay
if assert_notequal('ipsum dolor si', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

qa!
