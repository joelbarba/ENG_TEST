#!/bin/bash

cd /media/DISK3/PROGRAMES_PROPIS/APLICACIONS_WEB/ENG_TEST

echo "git checkout master - Seleccionar branca MASTER"
git checkout master

echo "git merge -s ours --no-commit barba_laptop - Fusionar branques a partir de MASTER"
read x
git merge -s ours --no-commit barba_laptop

echo "git difftool -g -d barba_laptop - Copiar canvis d'esquerra a dreta: barba_laptop -> master"
read x
git difftool -g -d barba_laptop 

echo "git add . + git commit - Commitar nova versió fusionada"
read x
git add . 
git status
echo "Segur que vols executar el commit?"
echo x
git commit -m 'FUSIO branca master + barba_laptop'

echo "git checkout barba_laptop + git merge master - Avançar branca BARBA_LAPTOP al mateix punt"
read x
git checkout barba_laptop 
git merge master

echo "OK - Fi correcte"
