#! /bin/bash
projectRoot="${PWD}/${1}"

clear
cd "${projectRoot}/bin"

echo "Cleaning..."
ghdl --clean
rm *.cf

echo "Analysing..."
files=$(ls ../pkgs | grep ".vhd")
for f in ${files}
do
    units=${units}$'../pkgs/'${f}$'\n'
done

files=$(ls ../src | grep ".vhd")
for f in ${files}
do
    units=${units}$'../src/'${f}$'\n'
done

files=$(ls .. | grep ".vhd")
for f in ${files}
do
    units=${units}$'../'${f}$'\n'
done

ghdl -a ${units}

echo "Generating Executables..."
units=$(ls ../src/ | grep ".vhd")
units=${units}$'\n'$(ls ../ | grep ".vhd")
units=$(basename -s ".vhd" $(basename -s ".vhdl" ${units}))

echo "Executables:"
for u in $units
do
    echo -e "\t${u}"
    ghdl -e "${u}"
done
