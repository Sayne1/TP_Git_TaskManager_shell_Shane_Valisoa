#!/bin/bash

auvegarder_base()
 if [ -f "task.txt" ]; then
   echo "le fichier existe"
   cp tasks.txt task_backup.txt
   echo "sauvegarde creer : tasks_backup.txt"
 fi
git commit -m 'feat : ajout fonction restaurer_base'

