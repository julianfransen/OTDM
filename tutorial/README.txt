I have created 2 models. 

In bash, run "ampl". Once the program is running, type this:
"option solver cplex;"
"model svm.mod;"
"data data.dat;"
"solve;"
Then you see the result. My terminal shows:
ampl: option solver cplex;
ampl: model svm.mod
ampl: data data.dat
ampl: solve;
CPLEX 22.1.1.0: optimal solution; objective 0.1000000064
14 separable QP barrier iterations
No basis.

Finally, I quit the program.

quit
