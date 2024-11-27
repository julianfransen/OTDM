# -------------------------------------------------------------------------------
# Validation
# -------------------------------------------------------------------------------
param m;                     
param n;                      
param data {1..m, 1..(n+1)};

param n_eval;
param gamma;
param w {1..n_eval};  

# Derived Parameters
param A {i in 1..m, j in 1..n} := data[i, j];
param y {i in 1..m} := data[i, (n+1)]; 

param results {i in 1..m} := if (sum {j in 1..n} A[i,j] * w[j] >= gamma) then 1 else -1;

# Metrics
param misclass := ((sum{k in 1..m} abs(results[k] - y[k]) / 2) / m);
param accuracy := 1 - misclass;
param true_positive := (sum{i in 1..m} (if results[i] = 1 and y[i] = 1 then 1 else 0));
param true_negative := (sum {i in 1..m} (if results[i] = -1 and y[i] = -1 then 1 else 0));
param false_positive := (sum {i in 1..m} (if results[i] = 1 and y[i] = -1 then 1 else 0));
param false_negative := (sum {i in 1..m} (if results[i] = -1 and y[i] = 1 then 1 else 0));

param precision := (if true_positive + false_positive > 0 then true_positive / (true_positive + false_positive) else 0);
param recall := (if true_positive + false_negative > 0 then true_positive / (true_positive + false_negative) else 0);
param f1_score := (if precision + recall > 0 then 2 * precision * recall / (precision + recall) else 0);