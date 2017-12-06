#!/bin/bash
shopt -s nullglob

echo "Processing ${1} --> ${2}";
cd /caesium/$1;
for file in *
do
    if [ -d "${file}" ] ; then
        /caesiumbin/entrypoint.sh "${1}/${file}" "${2}/${file}";
    else 
        if ( [ ${file: -4} == ".png" ] || [ ${file: -4} == ".jpg" ] ); then
            caesiumclt -q 80 -o "/caesium/${2}" "${file}";
            if [ $? -ne 0 ]; then
                cp "${file}" "/caesium/${2}/${file}";
            fi
        else
            cp "${file}" "/caesium/${2}/${file}";
        fi
    fi
done
