#!/bin/bash
#p07.sh
#Pol Sanz

clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 2 
fi

echo "Nom del directori del sistema: " #s'ha de posat la /
read dir

if [[ -d $dir ]]
then
	cp -r $dir /mnt/$dir.$(date +"%Y%m%d%H%M")
	echo "Directori $dir copiat"
	exit 0
else
	echo "Error: El directori $dir no existeix"
	exit 1
fi
