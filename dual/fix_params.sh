#!/bin/bash

# Check if input file is given
if [ -z "$1" ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Input file from command-line argument
INPUT_FILE="$1"

# Generate output file name by removing the extension and adding 'fixed.dat'
OUTPUT_FILE="${INPUT_FILE%.*}formated.dat"

# Begin processing
echo "Processing $INPUT_FILE into $OUTPUT_FILE..."

# Create or overwrite the output file
> "$OUTPUT_FILE"

# Parse the input file and transform it
while IFS= read -r line; do
    # Check for the "n =" line and format it correctly
    if [[ "$line" =~ ^n[[:space:]]*=[[:space:]]*([0-9]+) ]]; then
        echo "param n_eval := ${BASH_REMATCH[1]};" >> "$OUTPUT_FILE"

    # Check for the "gamma =" line and format it correctly
    elif [[ "$line" =~ ^gamma[[:space:]]*=[[:space:]]*(-?[0-9]+\.[0-9]+) ]]; then
        echo "param gamma := ${BASH_REMATCH[1]};" >> "$OUTPUT_FILE"

    # Handle the "w [*] := " line to start the weight array
    elif [[ "$line" =~ ^w[[:space:]]*\[\*\][[:space:]]*:= ]]; then
        echo -e "\nparam w :=" >> "$OUTPUT_FILE"

    # Handle the semicolon (";") line to close the weight array
    elif [[ "$line" =~ ^[[:space:]]*[\;][[:space:]]*$ ]]; then
        echo ";" >> "$OUTPUT_FILE"

    # Handle weight array entries
    elif [[ "$line" =~ ^[[:space:]]*([0-9]+)[[:space:]]+(-?[0-9]+\.[0-9]+) ]]; then
        echo "${BASH_REMATCH[1]}  ${BASH_REMATCH[2]}" >> "$OUTPUT_FILE"
    fi
done < "$INPUT_FILE"

echo "Transformation complete. Output saved to $OUTPUT_FILE."
