#!/bin/bash

# Source directory containing .tex files
SOURCE_DIR="./TexFiles"

# Destination directory for PDF files
DEST_DIR="./PDF"
mkdir DEST_DIR

# Find all .tex files recursively in the source directory
TEX_FILES=$(find "$SOURCE_DIR" -type f -name "*.tex")

# Compile each .tex file and place the PDF in the destination directory
for TEX_FILE in $TEX_FILES; do
  # Create the destination subdirectory structure
  RELATIVE_PATH=$(realpath --relative-to="$SOURCE_DIR" "$TEX_FILE")
  OUTPUT_DIR="$DEST_DIR/$(dirname "$RELATIVE_PATH")"
  mkdir -p "$OUTPUT_DIR"

  # Compile the LaTeX file using latexmk and place the PDF in the destination directory
  latexmk -pdf -output-directory="$OUTPUT_DIR" "$TEX_FILE"
done

git config user.email "actions@github.com"
git config user.name "GitHub Actions"
git add "$DEST_DIR" # Add all changes in the source directory
git commit -m "Compile and update PDFs" # Commit the changes with a message
git push
