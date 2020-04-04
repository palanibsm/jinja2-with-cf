#!/bin/bash

usage()
{
    echo "usage: <script.sh> <sourcefile.yml> <datafile.json>"
}

if [ "$#" -ne 2 ]; then
    echo "Expected number of parameters are two. Check below for guidance..."
    usage
    exit 1
fi

filename=$1
datafile=$2

echo "Source template: $filename"
echo "Parameter file: $datafile"
dest_file="processed/$filename"
echo "Processed File:" $dest_file

cat $filename | python j2.py $datafile > $dest_file
