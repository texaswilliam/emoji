#!/usr/bin/bash

pushd "$(dirname $0)/.." > /dev/null

[ -f README.md ] && rm README.md

firstfile=1

for filename in *
do
    if [ -f "$filename" ]
    then
        barename=${filename%.*}

        if [ "$firstfile" -eq 1 ]
        then
            firstfile=0
        else
            echo >> README.md
        fi

        echo "### :${barename}:" >> README.md
        echo "![:${barename}:](/${filename})" >> README.md
    fi
done

popd > /dev/null
