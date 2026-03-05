#!/bin/bash

restaurer_base()
   if [ -f "tasks_backup.txt" ]; then
      cp tasks_backup.txt
      echo "base restauree depuis la sauvegarde"
   fi
git commit -m 'feat : ajout fonction restaurer_base'
