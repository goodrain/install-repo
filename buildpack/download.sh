#!/bin/bash

lang_dev=${1:-all}

language=(java php  nodejs ruby golang html python common)

if [ "$lang_dev" == "all" ];then
    for lang in ${language[@]}
    do
        if [ -f "/language/${lang}" ];then
            echo "Installing ${lang} requirements"
            /language/${lang}
        fi
    done
elif [ "$1" == "bash" ];then
    exec /bin/bash
else
    if [ -f "/language/${lang_dev}" ];then
        echo "Installing ${lang_dev} requirements."
        /language/${lang_dev}
    else
        echo "Not Found ${lang_dev}."
    fi
fi