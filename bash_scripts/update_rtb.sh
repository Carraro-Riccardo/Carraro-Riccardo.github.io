folder_path="./docs/RTB/"
markdown_file="RTB.md"

cd ./_pages
cd "$folder_path" || exit

# Inizializza il file Markdown con l'intestazione
> "../$markdown_file"

echo "---" >> "../$markdown_file"
echo "layout: default" >> "../$markdown_file"
echo "title: RTB" >> "../$markdown_file"
echo "---" >> "../$markdown_file"
echo "### Requirments and Technologies Baselines"

# Funzione ricorsiva per aggiungere il nome delle sottocartelle e il loro contenuto
function add_folder_contents {
  local current_folder="$1"
  local indent="$2"
  for item in "$current_folder"/*; do
    if [ -f "$item" ]; then
      # Se è un file, aggiungi un link al file nel Markdown
      clear_folder_path=$(echo "$current_folder" | cut -c 3-)
      echo "${indent}- [$(basename "$item")]($folder_path$clear_folder_path/$(basename "$item"))" >> "../$markdown_file"
    elif [ -d "$item" ]; then
      # Se è una sottocartella, aggiungi il nome e poi chiamata ricorsiva
      folder_name=$(basename "$item")
      echo "${indent}- **$folder_name**" >> "../$markdown_file"
      add_folder_contents "$item" "  $indent" # Aggiungi uno spazio di indentazione
    fi
  done
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
