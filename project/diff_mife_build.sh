#!/bin/bash

global_WORK_DIR=$(pwd)
global_COMPARE_NEW=/home/work/build/mife-nginx
global_COMPARE_OLD=/home/work/compare/mife-nginx

function single_build_and_compare()
{
    local job_name=$1
    rm -rf ${global_COMPARE_NEW}/release
    rm -rf ${global_COMPARE_OLD}/release
    cd ${global_COMPARE_NEW}
    sh ${global_COMPARE_NEW}/build.sh $job_name
    cd ${global_COMPARE_OLD}
    sh ${global_COMPARE_OLD}/build.sh $job_name
    diff -r -q ${global_COMPARE_NEW}/release ${global_COMPARE_OLD}/release > ${global_WORK_DIR}/result/${job_name}.diff
}

cd ${global_WORK_DIR}
rm -rf ${global_WORK_DIR}/result
mkdir -p ${global_WORK_DIR}/result

while IFS= read -r line; do
    echo $line
    single_build_and_compare $line
done < ${global_WORK_DIR}/job_names.txt

find ${global_WORK_DIR}/result -name "*.diff" | xargs cat
