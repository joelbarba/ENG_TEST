#!/bin/bash

cd /media/DISK3/PROGRAMES_PROPIS/APLICACIONS_WEB/ENG_TEST


echo "Procediment per commitar canvis al repositori local i exportar-los a GitHub :"
echo "Selecciona la branca correcte (C = casa / O = oficina) per defecte CASA :"
read x
if [ "$x" = "O" ]; then
	branca="oficina"
else
	branca="casa"
fi

echo ""
echo "--> GIT CHECKOUT $branca"
git checkout $branca

echo ""
echo "--> GIT STATUS (estat dels fitxers modificats)"
git status
echo ""
echo "--> GIT ADD (afegir tots els fitxers a Staged) (S/n)"
read x
if [ "$x" = "n" ]; then
	echo "No s'han afegit els fitxers"
else
	git add *
fi
echo "--> GIT STATUS (fitxers preparats per commitar)"
git status
echo ""
echo "--> GIT COMMIT : introduir el comentari"
read comentari
comanda="git commit -m '$comentari'"
echo $comanda;
eval $comanda;

echo ""
echo "Exportar branca $branca a GITHUB"
echo "--> GIT PUSH github $branca (usr=joelbarba, pwd=cocaina02)"
git push github $branca

echo ""
echo "Avançar branca MASTER a $branca"
echo "--> GIT CHECKOUT MASTER + GIT MERGE $branca"
read x
git checkout master
git merge $branca

echo ""
echo "Exportar branca MASTER a GITHUB"
echo "--> GIT PUSH github master (usr=joelbarba, pwd=cocaina02)"
git push github master

echo ""
echo "Tornar a la branca de treball ($branca)"
git checkout $branca

echo "Final"
exit 0;
