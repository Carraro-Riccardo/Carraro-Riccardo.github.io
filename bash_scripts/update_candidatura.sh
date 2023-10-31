        folder_path="./docs/Candidatura/"
        markdown_file="prova.md"
        
        cd "$folder_path" || exit
        echo "# Candidatura\n" >> "../$markdown_file"
        for file in *; do
          if [ -f "$file" ]; then
            echo "- [${file}](${folder_path}${file})\n" >> "../$markdown_file"
          fi
        done

        git config user.email "actions@github.com"
        git config user.name "GitHub Actions"
        git add "../$markdown_file"
        git commit -m "Update file links"
        git push
