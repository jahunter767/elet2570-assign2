#! /bin/bash
projectRoot="${PWD}"
testbench="${1}"

echo "Deleting old vcd..."
rm "${projectRoot}/vcds/${testbench}.vcd"

cd "${projectRoot}/bin"
echo "--------------------------Run-------------------------"
ghdl -r "${testbench}" --vcd="${projectRoot}/vcds/${testbench}.vcd"
