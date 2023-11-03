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

git branch
git clone -b side-docs 'https://github.com/Carraro-Riccardo/Carraro-Riccardo.github.io'
cd ./Carraro-Riccardo.github.io
dir
folder_path="./1 - Candidatura/"
markdown_file="candidatura.md"

cd "$folder_path" || exit

# Inizializza il file Markdown con l'intestazione


content_file="---\nlayout: default\ntitle: Candidatura\n---\n### Presentazione e Candidatura\n"

# Funzione ricorsiva per aggiungere il nome delle sottocartelle e il loro contenuto
function add_folder_contents {
  local current_folder="$1"
  local indent="$2"
  for item in "$current_folder"/*; do
    if [ -f "$item" ]; then
      # Se è un file, aggiungi un link al file nel Markdown
      clear_folder_path=$(echo "$current_folder" | cut -c 3-)
      content_file+="${indent}- [$(basename "$item")]($folder_path$clear_folder_path/$(basename "$item"))\n"
    elif [ -d "$item" ]; then
      # Se è una sottocartella, aggiungi il nome e poi chiamata ricorsiva
      folder_name=$(basename "$item")
      content_file+="${indent}- **$folder_name**\n"
      add_folder_contents "$item" "  $indent" # Aggiungi uno spazio di indentazione
    fi
  done
}

# Esegui la funzione ricorsiva sulla cartella principale
add_folder_contents . ""

git branch
git checkout try-change-path
dir
echo "$content_file"
echo -e "$content_file" > "$markdown_file"
dir

git remote -v
git config user.email "actions@github.com"
git config user.name "GitHub Actions"
git add "$markdown_file"
git commit -m "Update file links"
git push origin try-change-path
