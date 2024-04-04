#!/bin/bash

DIR=${1:-plecak}

echo "Podałeś kat: ${DIR}"

if [[ -d "${DIR}" ]]
then
    echo "Usuwam ${DIR}"
    rm -rf "${DIR}"
fi

mkdir "${DIR}"

ITEMS=$(cat sprzet)

COUNTER=0
for ITEM in ${ITEMS}; do
    echo "Pracuje nad: ${ITEM}"
    if [[ $((COUNTER % 2)) -eq 0 ]]; then
	echo "Tworze plik"
	touch "${DIR}/${ITEM}"
    else
	echo "Tworze katalog"
	touch "${DIR}/${ITEM}"
    fi
    COUNTER=$((COUNTER + 1))
done

echo "$(date +"%Y") utworzylem ${COUNTER} plikow."
