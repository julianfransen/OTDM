#!/bin/bash

cd /home/julian/uni_folder/OTDM/OTDM_p2/OTDM/primal/

# Loop through nu values from 0.1 to 1.0 in increments of 0.1
for nu in $(seq 0.1 0.1 1.0); do
    echo "Running for nu = $nu"
    /home/julian/uni_folder/OTDM/OTDM_p2/OTDM/ampl_linux-intel64/ampl <<EOF
option solver cplex;
model primal.mod;
data trs.dat;
let nu := $nu;
solve;
display w, gamma;
quit;
EOF
done

