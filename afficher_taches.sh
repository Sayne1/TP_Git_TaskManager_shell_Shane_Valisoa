#!/bin/bash

afficher_taches() {
    if [ -f tasks.txt ]; then
        echo "------------------------------------------"
        echo "ID | Description | Statut"
        echo "------------------------------------------"
        while IFS= read -r line || [ -n "$line" ]; do
            id=$(echo "$line" | cut -d'|' -f1)
            desc=$(echo "$line" | cut -d'|' -f2)
            statut=$(echo "$line" | cut -d'|' -f3)

            if [ "$statut" = "1" ]; then
                echo "[$id] $desc -> TERMINEE"
            else
                echo "[$id] $desc -> EN COURS"
            fi
        done < tasks.txt

        git add tasks.txt
        git commit -m 'feat: ajout fonction afficher_taches'
    else
        echo "Le fichier tasks.txt n'existe pas."
    fi
}
