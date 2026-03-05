#!/bin/bash

source taskTool.sh
source dataTask.sh

if [ "$choix" = '1' ]; then
  initialiser_base
elif [ "$choix" = '2' ]; then
  ajouter_tache
# ... compléter avec les autres cas
elif [ "$choix" = '0' ]; then
  echo 'Au revoir !'
  break
else
  echo 'Choix invalide.'
fi
done
 
