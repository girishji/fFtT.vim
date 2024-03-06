#!/bin/bash

# put vim in ex mode so that error messages appear in stderr/stdout. otherwise
# vim clears stdout/stderr on exit. use `verbose` to direct messages to stderr.
# syntax errors can make the test hang.

test_file='highlight.vim'

vim -nEs -u DEFAULTS -S <(cat <<EOF
    vim9script
    set shortmess=I
    so ../plugin/fFtTplus.vim
    so ./${test_file}
    qa!
EOF
)
