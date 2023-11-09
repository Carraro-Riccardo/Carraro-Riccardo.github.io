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
echo "<style>body{font-family:Arial,sans-serif;margin:20px;} .file-list{list-style:none;padding:0;} .file-item{display:flex;justify-content:space-between;border-bottom:1px solid #ddd;padding:10px;align-items:center;} .file-name{flex:1;margin-right:10px;text-decoration:underline;color:inherit;} a:visited {color: #bbb !important;} .download-button{background-color:#239fa9;color:white;padding:8px 16px;text-align:center;text-decoration:none;display:inline-block;font-size:14px;cursor:pointer;border:none;border-radius:4px;} .folder-name{font-weight:bold;color:#ff333a;font-size:16px; text-decoration: none} .download-button:visited{color: white;}</style>" >> "../$markdown_file"
echo "### Presentazione e Candidatura"

# Funzione ricorsiva per aggiungere il nome delle sottocartelle e il loro contenuto
function add_folder_contents {
  local current_folder="$1"
  local indent="$2"
  echo "<ul class=\"file-list\">" >> "../$markdown_file"
  for item in "$current_folder"/*; do
    if [ -f "$item" ]; then
      # Se è un file, aggiungi un link al file nel Markdown
      clear_folder_path=$(echo "$current_folder" | cut -c 3-)
      echo "<li class=\"file-item\">" >> "../$markdown_file"
      echo "<a href=\"$folder_path$clear_folder_path/$(basename "$item")\" class=\"file-name\"> $(basename "$item") </a>" >> "../$markdown_file"
      echo "<a href=\"$folder_path$clear_folder_path/$(basename "$item")\" class=\"download-button\" download> download</a>" >> "../$markdown_file"
      #echo "${indent}- [$(basename "$item")]($folder_path$clear_folder_path/$(basename "$item"))" >> "../$markdown_file"
      echo "</li>" >> "../$markdown_file"
    elif [ -d "$item" ]; then
      # Se è una sottocartella, aggiungi il nome e poi chiamata ricorsiva
      folder_name=$(basename "$item")

      echo "<li class=\"file-item\">" >> "../$markdown_file"
      echo "<span class=\"file-name folder-name\">$folder_name</span>" >> "../$markdown_file"
      echo "</li>" >> "../$markdown_file"
      
      #echo "${indent}- **$folder_name**" >> "../$markdown_file"
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
