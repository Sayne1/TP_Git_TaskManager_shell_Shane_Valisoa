#!/bin/bash

supprimer_tache() {
    echo "Entrez l'ID de la tâche à supprimer :"
    read id_suppr

    temp_file="tasks_temp.txt"
    touch "$temp_file"

    while IFS= read -r line || [ -n "$line" ]; do
        id_actuel=$(echo "$line" | cut -d'|' -f1)
        if [ "$id_actuel" != "$id_suppr" ]; then
            echo "$line" >> "$temp_file"
        fi
    done < tasks.txt

    mv "$temp_file" tasks.txt

    git add tasks.txt
    git commit -m 'feat: ajout fonction supprimer_tache'
}
