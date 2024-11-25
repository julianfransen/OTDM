#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <output_file> <number_of_data_points>"
    exit 1
fi

# Command-line arguments
input_file="$1"
output_file="$2"
num_points="$3"

# Step 1: Add header to the output file
cat <<EOL > "$output_file"
param m := $num_points;
param n := 4;

# Full data matrix including features and labels
param data: 1 2 3 4 5 :=     
EOL

# Step 2: Process the file
# Remove '*' symbols and enumerate the data
count=$(grep -o '\*' "$input_file" | wc -l) # Count '*' occurrences

awk '{gsub(/\*/, ""); print NR "\t" $0}' "$input_file" >> "$output_file"

# Print the count of '*' symbols removed
echo "Number of '*' symbols removed: $count"
