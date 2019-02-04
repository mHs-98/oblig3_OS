#!/bin/bash
# no arguments, display a menu with option for info
# about processes

clear
while [ "$svar" != "9" ]
do
 echo ""
 echo "  1 - Hvem er jeg?"
 echo "  9 - Avslutt dette scriptet"
 echo ""
 echo -n "Velg en funksjon: "
 read -r svar
 echo ""
 case $svar in
  1)clear
    echo "Jeg er $(whoami)"
    read -r
    clear
    ;;
  9)echo Scriptet avsluttet
    exit
    ;;
  *)echo Ugyldig valg
    read -r
    clear
    ;;
 esac
done

