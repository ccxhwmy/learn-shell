#!/bin/bash
set -x

MAX_FILE_ROWS=150
cur_row=0
cut_log_shell="cut_log.sh"
test_cut_log_file="test_cut_log.txt"

[ ! -f "${cut_log_shell}" ] && echo "cut_log_shell does not exist" && exit 1

touch ${test_cut_log_file}

until [ "${cur_row}" -ge "${MAX_FILE_ROWS}" ]
do
    let "cur_row += 1"
    echo "$cur_row" >> ${test_cut_log_file}
done

./${cut_log_shell} ${test_cut_log_file}

exit 0

bbbbb
