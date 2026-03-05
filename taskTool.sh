  ajouter_tache() {
    echo "Entrez la description de la tâche :"
    read description

    if [ ! -f tasks.txt ]; then
        id=1
    else
        nb_lignes=$(wc -l < tasks.txt)
        id=$((nb_lignes + 1))
    fi

    echo "$id|$description|0" >> tasks.txt

    git add tasks.txt
    git commit -m 'feat: ajout fonction ajouter_tache'
}

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
marquer_terminee() {
    echo "Entrez l'ID de la tâche à marquer comme terminée :"
    read id_recherche

    temp_file="tasks_temp.txt"
    trouve=false

    while IFS= read -r line; do
        id_actuel=$(echo "$line" | cut -d'|' -f1)

        if [ "$id_actuel" == "$id_recherche" ]; then
            nouvelle_ligne=$(echo "$line" | sed 's/0$/1/')
            echo "$nouvelle_ligne" >> "$temp_file"
            trouve=true
        else
            echo "$line" >> "$temp_file"
        fi
    done < tasks.txt

    mv "$temp_file" tasks.txt

    if [ "$trouve" = true ]; then
        echo "Tâche $id_recherche mise à jour avec succès."
        git add tasks.txt
        git commit -m 'feat: ajout fonction marquer_terminee'
    else
        echo "Aucune tâche trouvée avec l'ID $id_recherche."
    fi
}
