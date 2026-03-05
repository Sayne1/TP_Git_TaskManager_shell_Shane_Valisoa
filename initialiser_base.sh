#!/bin/bash

path="/Documents/TP_Git_TaskManager_shell_Shane_Valisoa/dataTasks.txt"

initialiser_base(){
   if [ -f "$path" ]; then
      echo "le fichier  existe"
   else 
      echo "le fichier n' existe pas"
      touch tasks.txt
   fi
git commit -m 'feat : ajout fonction initialiser_base'
}

