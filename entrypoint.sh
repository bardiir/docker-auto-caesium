#!/bin/bash
shopt -s nullglob

if [ ! -d "/tmp/caesium/" ]; then
    mkdir -p "/tmp/caesium"
fi

echo "Processing ${1}";
cd "/caesium/$1";
for file in *
do
    if [ -d "${file}" ] ; then
        /caesiumbin/entrypoint.sh "${1}/${file}";
    else 
        if ( [ ${file: -4} == ".png" ] || [ ${file: -4} == ".jpg" ] ); then
            if grep -Fxq "${file}" .caesiumoptimized
            then
                echo "${file} already optimized in previous run. Skipping";
                continue
            fi
            
            rm -rf "/tmp/caesium/*";
            caesiumclt -q 80 -o "/tmp/caesium/" "${file}" | cat; # suppress segmentation faults from caesium for the time beeing
            if [ ${PIPESTATUS[0]} -eq 0 ]; then
                oldsize=$(wc -c <"${file}")
                
                newsize=$(wc -c <"/tmp/caesium/${file}")
                if [ $newsize -lt $oldsize ]; then
                    chown `stat -c "%u:%g" "${file}"` "/tmp/caesium/${file}";
                    chmod `stat -c "%a" "${file}"` "/tmp/caesium/${file}";
                    mv "/tmp/caesium/${file}" "${file}";
                else
                    echo "Optimized file is not smaller. Skipping";
                fi
            else
                echo "Optimizing file ${file} failed. Skipping";
            fi
            
            echo "${file}" >> .caesiumoptimized
        fi
    fi
done
