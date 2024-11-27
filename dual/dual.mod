# Dual SVM Model

# Parameters
param m;                     # Number of data points
param n;                     # Number of features
param nu > 0;                # Regularization parameter
param data {1..m, 1..(n+1)}; # Full data matrix including labels as last column

# Derived Parameters
param A {i in 1..m, j in 1..n} := data[i, j];  # Feature matrix
param y {i in 1..m} := data[i, (n+1)];        # Labels (+1 or -1)

# Precompute Kernel Matrix (dot products of features scaled by labels)
param K {i in 1..m, j in 1..m} := y[i] * y[j] * sum {k in 1..n} A[i, k] * A[j, k];

# Decision Variables
var lambda {1..m} >= 0, <= nu; # Dual variables (bounded by nu)
var w {1..n};
var gamma;

# Objective Function
maximize Dual_Objective:
    sum {i in 1..m} lambda[i] - 0.5 * sum {i in 1..m, j in 1..m} lambda[i] * lambda[j] * K[i, j];

# Constraints
subject to Equality_Constraint:
    sum {i in 1..m} lambda[i] * y[i] = 0;

# Retrieve Weight Vector
subject to Retrieve_w {j in 1..n}:
    w[j] = sum {i in 1..m} lambda[i] * y[i] * A[i, j];

# Compute Gamma
subject to Compute_Gamma:
    gamma = y[1] - sum {j in 1..n} w[j] * A[1, j];