#!/bin/sh
# 
# Help me tar the homework files.

isdigit() {
    if grep -E '^[[:digit:]]+$' <<< $1 > /dev/null
    then
        return 0
    else
        return 1
    fi
}

if [ ! $1 ] || 
   [ $1 = "--help" ] || 
   ! isdigit $1
then
    echo "Usage: $0 N [V] (N = #hw, V = #ver)"
    exit 1
elif [ $2 ] && ! isdigit $2
then
    echo "Usage: $0 N V  (N = #hw, V = #ver)"
    exit 1
fi

if [ ! -e hw$1 ]
then
    echo "Directory hw$1 doesn't exist."
    exit 1
fi

cd hw$1
ID=b03902086
tar -zcvf "HW$1_${ID}_ver${2:-1}.tar.gz" $ID*