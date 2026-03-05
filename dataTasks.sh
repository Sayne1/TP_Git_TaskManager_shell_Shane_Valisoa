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


afficher_toutes_taches(){
   if [ -f  "tasks.txt" ]; then
      echo "le fichier  exixte"
      cat tasks.txt
   else
      echo "base non initialise"
   fi
git commit -m 'feat: ajout fonction afficher_toutes_taches'
}

sauvegarder_base()
 if [ -f "task.txt" ]; then
   echo "le fichier existe"
   cp tasks.txt task_backup.txt
   echo "sauvegarde creer : tasks_backup.txt"
 fi
git commit -m 'feat : ajout fonction restaurer_base'


restaurer_base()
   if [ -f "tasks_backup.txt" ]; then
      cp tasks_backup.txt
      echo "base restauree depuis la sauvegarde"
   fi
git commit -m 'feat : ajout fonction restaurer_base'

supprimer_base(){
   if  [ -f "tasks.txt"]; then
      echo "le fichier existe"
      echo "voulez vous supprimer le fichier?"
      read ans
      if [ $ans = 'y']; then
         rm tasks.txt
      fi
   fi
git commit -m 'feat : ajout fonction supprimer_base'
}
