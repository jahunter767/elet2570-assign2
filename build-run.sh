#! /bin/bash
projectDir="${1}"
testbench="${2}"

./build.sh ${projectDir}
./run.sh ${projectDir} ${testbench}
