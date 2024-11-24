# SVM primal formulation
# Parameters
param N;                     # Number of data points
param d;                     # Number of features
param C > 0;                 # Regularization parameter
param x {1..N, 1..d};        # Feature vectors (matrix)
param y {1..N};              # Labels (+1 or -1)

# Decision Variables
var w {1..d};                # Weight vector
var b;                       # Bias term
var xi {1..N} >= 0;          # Slack variables (non-negative)

# Objective Function
minimize SVM_Objective:
    0.5 * sum {j in 1..d} w[j]^2 + C * sum {i in 1..N} xi[i];

# Constraints
subject to Margin_Constraint {i in 1..N}:
    y[i] * (sum {j in 1..d} w[j] * x[i, j] + b) >= 1 - xi[i];

subject to Slack_Nonnegativity {i in 1..N}:
    xi[i] >= 0;

