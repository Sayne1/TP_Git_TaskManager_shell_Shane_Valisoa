#!/bin/bash

afficher_toutes_taches(){
   if [ -f  "tasks.txt" ]; then
      echo "le fichier  exixte"
      cat tasks.txt
   else
      echo "base non initialise"
   fi
git commit -m 'feat: ajout fonction afficher_toutes_taches'
}
