#!/bin/bash

IFS=$'\n'

function TotalNumberOfFolders() {
    echo "Total number of folders (including all nested ones) = `find $1 -type d | wc -l`"
}

function Top5Folders() {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    folder_list=`du -h $1 | sort -nr | head -n 5 | awk '{print" - "$2", "$1}'`
    counter=0
    for folder in $folder_list
    do
    counter=$(( $counter + 1 ))
    echo "$counter $folder"
    done
}

function TotalNumberOfFiles() {
    echo "Total number of files = `find $1 -type f | wc -l`"
}

function TypeOfFiles() {
    echo "Configuration files (with the .conf extension) = `find $1 -name "*.conf" | wc -l`"
    echo "Text files = `find $1 -name "*.txt" | wc -l`"
    echo "Executable files = `find $1 -type f -executable | wc -l`"
    echo "Log files (with the extension .log) = `find $1 -name "*.log" | wc -l`"
    echo "Archive files = `find $1 -name "*.tar"  | wc -l`"
    echo "Symbolic links = `find $1 -type l | wc -l`"
}

function Top10Files() {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    file_list=`find $1 -type f -exec du -h {} + 2>/dev/null | sort -nr | head -n 10`
    counter=0
    for file in $file_list
    do 
    counter=$(( $counter + 1 ))
    echo -n "$counter - "
    path=`echo $file | awk '{print $2}'`
    echo -n "$path, "
    size=`echo $file | awk '{print $1}'`
    echo -n "$size, "
    type=`file -b $path | sed 's/,.*//'`
    echo "$type"
    done
}

function Top10ExecFiles() {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    file_list=`find $1 -type f -executable -exec du -h {} + 2>/dev/null | sort -nr | head -n 10`
    counter=0
    for file in $file_list
    do 
    counter=$(( $counter + 1 ))
    echo -n "$counter - "
    path=`echo $file | awk '{print $2}'`
    echo -n "$path, "
    size=`echo $file | awk '{print $1}'`
    echo -n "$size, "
    hash=`md5sum $path | awk '{print $1}'`
    echo "$hash"
    done
}