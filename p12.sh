#!/bin/bash
#p12.sh
#Pol Sanz

until [[ $cont == 'n' ]]
do

clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 2 
fi


function comprova {
	
	if [[ -d /mnt/cpseg ]]
	then
		echo "El directori /mnt/cpseg existeix"
	else
		echo "El directori /mnt/cpseg no existeix"
		echo " "
		echo "Creant el directori......"
		mkdir /mnt/cpseg
		echo " "
		echo "Directori creat"
	fi
}

function copia {
	
	cp /etc/crontab /mnt/cpseg/
	cp /etc/hosts /mnt/cpseg/
	echo "Fitxers copiats"
	echo " "
	cd /mnt/cpseg/
	tar -cf backup.$(date +"%Y%m%d%H%M").tar.gz hosts crontab
	ls -ls /mnt/cpseg/
	echo " "
	echo " "
	
}

function esborra {
	
	rm /mnt/cpseg/hosts
	rm /mnt/cpseg/crontab
	echo "Fitxers esborrats"
	ls /mnt/cpseg/
	
}

comprova
copia
esborra

	echo 
	echo -n "Vols continuar (s/n): "
	read cont
done

exit 0
