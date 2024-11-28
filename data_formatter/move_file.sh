#!/bin/bash

# Usage: ./copy_file.sh filename destination_folder

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 filename destination_folder"
    exit 1
fi

# Assign arguments to variables
FILENAME="$1"
DESTINATION_FOLDER="$2"

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$0")

# Construct the full path of the source file
SOURCE_FILE="$SCRIPT_DIR/$FILENAME"

# Check if the source file exists in the script's directory
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File '$FILENAME' does not exist in the script's directory ($SCRIPT_DIR)."
    exit 1
fi

# Check if the destination folder exists
if [ ! -d "$DESTINATION_FOLDER" ]; then
    echo "Error: Destination folder '$DESTINATION_FOLDER' does not exist."
    exit 1
fi

# Copy the file to the destination folder
cp "$SOURCE_FILE" "$DESTINATION_FOLDER"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "File '$FILENAME' copied successfully to '$DESTINATION_FOLDER'."
else
    echo "Error: Failed to copy the file."
    exit 1
fi
