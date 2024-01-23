#!/bin/bash

#Prompting user for source directory
read -p "Enter the folder path: " folder_path

# Check if the provided path is a directory
if [ ! -d "$folder_path" ]; then
    echo "Error: $folder_path is not a directory."
    exit 1
fi

echo "Organizing files in $folder_path..."

# Creating subdirectories for each file extension
find "$folder_path" -type f | while read -r file; do
    # Get file extension
    extension="${file##*.}"

    # Creating subdirectory for the extension if it doesn't exist
    if [ ! -d "$folder_path/$extension" ]; then
        mkdir -p "$folder_path/$extension"
        echo "Created subdirectory: $folder_path/$extension"
    fi

    # Checking if the file is already in the target subdirectory
    if [ ! -e "$folder_path/$extension/$(basename "$file")" ]; then
        # Moving the file to the corresponding subdirectory
        mv "$file" "$folder_path/$extension/"
        echo "Moved: $file to $folder_path/$extension/"
    else
        echo "Skipped: $file (Already in $folder_path/$extension/)"
    fi
done

echo "Files organized successfully based on their extensions."
