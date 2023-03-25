#!/bin/bash
set -x

MIN_NUM_RESERVED_ROWS=100

[ -n "$1" ] && log_file="$1"

[ ! -f "${log_file}" ] && echo "\$1=log_file is not a exist nomarl file" && exit 1

file_rows=`wc -l ${log_file} | awk '{print $1}'`

if [ "${file_rows}" -le "${MIN_NUM_RESERVED_ROWS}" ]
then
    echo "line less than ${MIN_NUM_RESERVED_ROWS}, do not need to be cut"
    exit 1
fi

let "rows_to_clear=${file_rows}-${MIN_NUM_RESERVED_ROWS}"

sed_args="1,${rows_to_clear}d"
sed -i ${sed_args} ${log_file}
