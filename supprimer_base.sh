#!/bin/bash

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
