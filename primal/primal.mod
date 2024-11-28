# SVM primal formulation
# Parameters
param m;                     # Number of data points
param n;                       # number of features
param data {1..m, 1..(n+1)}; # Full data matrix including labels as last column
param nu > 0;                 # Regularization parameter

# Derived Parameters
param A {i in 1..m, j in 1..n} := data[i, j];  # Extract feature matrix
param y {i in 1..m} := data[i, (n+1)];           # Extract labels

# Decision Variables
var w {1..n};                # Weight vector
var gamma;                   # Bias term
var si {1..m} >= 0;          # Slack variables (non-negative)

# Objective Function
minimize SVM_Objective:
    0.5 * sum {j in 1..n} w[j]^2 + nu * sum {i in 1..m} si[i];

# Constraints
subject to Margin_Constraint {i in 1..m}:
    y[i] * (sum {j in 1..n} w[j] * A[i, j] + gamma) >= 1 - si[i];

subject to Slack_Nonnegativity {i in 1..m}:
    si[i] >= 0;

