#! /bin/bash
projectRoot="${PWD}/${1}"
testbench="${2}"

echo "Deleting old vcd..."
rm "${projectRoot}/vcds/${testbench}.vcd"

cd "${projectRoot}/bin"
echo "--------------------------Run-------------------------"
ghdl -r "${testbench}" --vcd="${projectRoot}/vcds/${testbench}.vcd"
