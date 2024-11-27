param m;                     
param n;                      
param data {1..m, 1..(n+1)};

param n_eval;
param gamma;
param w {1..n_eval};  

# Derived Parameters
param A {i in 1..m, j in 1..n} := data[i, j];
param y {i in 1..m} := data[i, (n+1)]; 

param pred {i in {1..m}} := gamma + sum{j in {1..n}} w[j] * A[i,j];
param y_pred {i in {1..m}} := if pred[i] <= 0 then -1 else 1;

# Metrics
param misclass := (sum{i in 1..m} (if y_pred[i] = y[i] then 0 else 1));
param accuracy := 1 - (misclass / m);
param true_positive := (sum{i in 1..m} (if y_pred[i] = 1 and y[i] = 1 then 1 else 0));
param true_negative := (sum {i in 1..m} (if y_pred[i] = -1 and y[i] = -1 then 1 else 0));
param false_positive := (sum {i in 1..m} (if y_pred[i] = 1 and y[i] = -1 then 1 else 0));
param false_negative := (sum {i in 1..m} (if y_pred[i] = -1 and y[i] = 1 then 1 else 0));

param precision := (if true_positive + false_positive > 0 then true_positive / (true_positive + false_positive) else 0);
param recall := (if true_positive + false_negative > 0 then true_positive / (true_positive + false_negative) else 0);
param f1_score := (if precision + recall > 0 then 2 * precision * recall / (precision + recall) else 0);