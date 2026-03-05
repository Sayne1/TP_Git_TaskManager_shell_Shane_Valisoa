#!/bin/bash

marquer_terminee() {
    echo "Entrez l'ID de la tâche à marquer comme terminée :"
    read id_recherche

    temp_file="tasks_temp.txt"
    trouve=false

    while IFS= read -r line || [ -n "$line" ]; do
        id_actuel=$(echo "$line" | cut -d'|' -f1)
        if [ "$id_actuel" = "$id_recherche" ]; then
            nouvelle_ligne=$(echo "$line" | sed 's/0$/1/')
            echo "$nouvelle_ligne" >> "$temp_file"
            trouve=true
        else
            echo "$line" >> "$temp_file"
        fi
    done < tasks.txt

    mv "$temp_file" tasks.txt

    if [ "$trouve" = true ]; then
        git add tasks.txt
        git commit -m 'feat: ajout fonction marquer_terminee'
    fi
}
