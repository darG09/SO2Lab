#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${1:-2remove}
TARGET_DIR=${1:-bakap}

echo ${SOURCE_DIR}
echo ${RM_LIST}
echo ${TARGET_DIR}

if [[ -d "TARGET_DIR" ]]; then
    echo "TARGET_DIR already exists"
    else
    echo "Creating TARGET_DIR"
    mkdir "TARGET_DIR"
fi

printf "first\nsecond\nthird\nfourth" > RM_LIST
FILES=$(cat RM_LIST)

mkdir "SOURCE_DIR"
cd "SOURCE_DIR"
touch "second"
touch "fourth"
touch "fifth"
mkdir "sixth"

for FILE in ${FILES}; do
    echo "Checking: ${FILE}"
    if [[ -f "${FILE}" ]]; then
	echo "Deleting ${FILE}"
	rm -rf "${FILE}"
    fi
done

REMAINS=$(ls)

for REMAIN in ${REMAINS}; do
    echo "Checking: ${REMAIN}"
    if [[ -f "${REMAIN}" ]]; then
	echo "Not on the list; Moving file ${REMAIN} to TARGET_DIR"
	mv "${REMAIN}" ~/Pulpit/so2/TARGET_DIR/
    elif [[ -d "${REMAIN}" ]]; then
    echo "Not on the list; Copying directory ${REMAIN} to TARGET_DIR"
    cp -r "${REMAIN}"/ ~/Pulpit/so2/TARGET_DIR/
    fi
done