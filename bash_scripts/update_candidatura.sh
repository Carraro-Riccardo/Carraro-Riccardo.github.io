        #folder_path="./docs/Candidatura/"
        #markdown_file="prova.md"
        
        #cd "$folder_path" || exit
        #> "../$markdown_file"
        #echo "# Candidatura" >> "../$markdown_file"
        #for file in *; do
          #if [ -f "$file" ]; then
            #echo "- [${file}](${folder_path}${file})" >> "../$markdown_file"
          #fi
        #done

        #git config user.email "actions@github.com"
        #git config user.name "GitHub Actions"
        #git add "../$markdown_file"
        #git commit -m "Update file links"
        #git push

cd ./_pages
folder_path="./docs/Candidatura/"
markdown_file="candidatura.md"

cd "$folder_path" || exit

# Inizializza il file Markdown con l'intestazione
> "../$markdown_file"

echo "---" >> "../$markdown_file"
echo "layout: default" >> "../$markdown_file"
echo "title: Candidatura" >> "../$markdown_file"
echo "---" >> "../$markdown_file"
echo "### Presentazione e Candidatura"

# Funzione ricorsiva per aggiungere il nome delle sottocartelle e il loro contenuto
function add_folder_contents {
  local current_folder="$1"
  local indent="$2"
  echo "<ul>" >> "../$markdown_file"
  for item in "$current_folder"/*; do
    if [ -f "$item" ]; then
      # Se è un file, aggiungi un link al file nel Markdown
      clear_folder_path=$(echo "$current_folder" | cut -c 3-)
      echo "<li>" >> "../$markdown_file"
      echo "<span> $(basename "$item") </span>" >> "../$markdown_file"
      echo "<a href=\"$folder_path$clear_folder_path/$(basename "$item")\" download> download</a>" >> "../$markdown_file"
      #echo "${indent}- [$(basename "$item")]($folder_path$clear_folder_path/$(basename "$item"))" >> "../$markdown_file"
      echo "</li>" >> "../$markdown_file"
    elif [ -d "$item" ]; then
      # Se è una sottocartella, aggiungi il nome e poi chiamata ricorsiva
      folder_name=$(basename "$item")
      echo "${indent}- **$folder_name**" >> "../$markdown_file"
      add_folder_contents "$item" "  $indent" # Aggiungi uno spazio di indentazione
    fi
  done
  echo "</ul>" >> "../$markdown_file"
}

# Esegui la funzione ricorsiva sulla cartella principale
add_folder_contents . ""

mv "../$markdown_file" ../../
# Esegui i comandi Git
git config user.email "actions@github.com"
git config user.name "GitHub Actions"
git add "../../$markdown_file"
git commit -m "Update file links"
git push
