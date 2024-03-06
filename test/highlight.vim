vim9script

so ./setup.vim

def Verify(cmd: string, not_hi: list<number>)
    exe $'normal {cmd}'
    if assert_equal([], getmatches()) == 0
        verbose echoerr v:errors
    endif
    for v in getmatches()[0]->values()
        if v->len() == 3
            if  v[0] != 1 || not_hi->index(v[1]) != -1
                verbose echoerr 'error at' v
            endif
        endif
    endfor
enddef

cursor(1, 1)
var nhi = range(1, 10)->extend([13, 15, 21, 23, 27, 29, 31, 51, 57])
Verify('f', nhi)

cursor(1, 19)
nhi = range(1, 19)
Verify('f', nhi)

cursor(1, 20)
nhi = range(15, 57)->extend([1, 4, 7, 8, 10, 11, 13])
Verify('F', nhi)

cursor(1, 20)
nhi = range(1, 25)->extend([27, 29, 30, 31, 32, 38, 40, 43, 44, 45, 51, 54, 57])
Verify('t', nhi)

cursor(1, 20)
nhi = range(15, 57)->extend([1, 4, 7, 8, 10, 11, 13])
Verify('T', nhi)

# Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'
qa!
