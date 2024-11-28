#!/bin/bash

# Usage: ./csv_to_dat.sh input.csv output.dat
# Ensure the input CSV file and script are in the same directory, or provide full paths.

# Check if input and output file arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.csv output.dat"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Read the number of rows (m) and columns (n) from the CSV file
m=$(($(wc -l < "$INPUT_FILE") - 1))  # Subtract 1 for the header row
n=$(head -n 1 "$INPUT_FILE" | awk -F',' '{print NF - 1}')  # Subtract 1 for the label column

# Start writing the .dat file
echo "param m := $m;" > "$OUTPUT_FILE"
echo "param n := $n;" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "# Full data matrix including features and labels" >> "$OUTPUT_FILE"
echo -n "param data:" >> "$OUTPUT_FILE"

# Append column indices to the header
for i in $(seq 1 $((n + 1))); do
    echo -n " $i" >> "$OUTPUT_FILE"
done
echo " :=" >> "$OUTPUT_FILE"

# Process each row of the CSV and append to the .dat file
tail -n +2 "$INPUT_FILE" | awk -F',' '{
    printf "%d", NR;
    for (i = 1; i <= NF; i++) printf "\t%f", $i;
    printf "\n";
}' >> "$OUTPUT_FILE"

# Finalize the .dat file
echo ";" >> "$OUTPUT_FILE"

echo "Conversion complete! Output saved to $OUTPUT_FILE."
