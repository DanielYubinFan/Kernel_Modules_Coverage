#!/bin/bash 
GCOV_KDIR_PREFIX=/sys/kernel/debug/gcov/
GCOV_KDIR_MOUNT=/sys/kernel/debug/
build_dir=`pwd`

mount -t debugfs none $GCOV_KDIR_MOUNT
cp -R $GCOV_KDIR_PREFIX/$build_dir/* $build_dir
geninfo . -o ./coverage_info --rc lcov_branch_coverage=1
genhtml -o ./lcov_data ./coverage_info --rc lcov_branch_coverage=1
