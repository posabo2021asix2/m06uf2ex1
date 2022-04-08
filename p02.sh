#!/bin/bash
#p02.sh
#Pol Sanz

until [[ $fin == 'n' ]]

do
clear

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 2 
fi

echo "Nom carpeta: "
read carp
if [[ ! -d /var/$carp ]]
then
	mkdir /var/$carp
	echo "Carpeta /var/$carp creada."
	else
	echo "La carpeta /var/$carp ja existeix."
fi
echo " "
echo " "
echo "COPIANT FITXERS......."
cp /etc/ssh/sshd_config /var/$carp/
cp /etc/cups/cupsd.conf /var/$carp/
echo "Fitxers copiats correctament"

echo "Vols continuar? (y/n): "
read fin
done
exit 5
