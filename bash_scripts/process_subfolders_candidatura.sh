#!/bin/bash

# Markdown file to store the structure
markdown_file="prova.md"
# Start processing the root directory
root_directory="./docs/Candidatura/"

cd $root_directory

# Create the Markdown file or clear it if it exists
> "$markdown_file"
echo "# File Structure" >> "$markdown_file"

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

    #Recursively process subdirectories
    for sub_dir in */; do
      process_directory "$sub_dir" "$indent  "
    done
  )
}

process_directory "$root_directory" ""

echo "File structure has been generated and saved in $markdown_file."

git config user.email "actions@github.com"
git config user.name "GitHub Actions"
git add "$markdown_file"
git commit -m "Update file links"
git push
