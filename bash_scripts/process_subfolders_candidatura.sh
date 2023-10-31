#!/bin/bash

# Markdown file to store the structure
markdown_file="prova.md"

# Function to process a directory
process_directory() {
  local dir="$1"
  local indent="$2"

  # Append the directory name with proper indentation
  echo "- $indent$(basename "$dir")" >> "$markdown_file"

  # Use a subshell to isolate directory changes
  (
    cd "$dir" || return

    # Loop through the files in the directory
    for file in *; do
      if [ -f "$file" ]; then
        # Append file names with proper indentation
        echo "  - $indent$file" >> "$markdown_file"
      fi
    done

    # Recursively process subdirectories
    for sub_dir in */; do
      echo $sub_dir
      process_directory "$sub_dir" "$indent  "
    done
  )

  # No need to return to the parent directory here
}

# Start processing the root directory
root_directory="./docs/Candidatura"

echo "# File Structure" > "${root_directory}/$markdown_file"
process_directory "$root_directory" ""

echo "File structure has been generated and saved in $markdown_file."
