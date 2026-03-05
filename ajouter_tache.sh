#!/bin/bash

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
