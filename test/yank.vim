vim9script

so ./setup.vim

# Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

cursor(1, 20)
norm "ayfc
'a'->getreg()
if assert_notequal('it amet, c', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm "ayto
'a'->getreg()
if assert_notequal('it amet, c', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm "ayTp
if assert_notequal('sum dolor s', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

cursor(1, 20)
norm "ayFi
if assert_notequal('ipsum dolor s', 'a'->getreg()) == 0
    verbose echoerr v:errors
endif

qa!
