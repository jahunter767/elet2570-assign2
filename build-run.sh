#! /bin/bash
projectDir="${PWD}"
testbench="${1}"

./build.sh ${projectDir}
./run.sh ${projectDir} ${testbench}
