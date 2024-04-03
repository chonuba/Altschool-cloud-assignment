#!/bin/bash

# This scrpt serves to automate the processing of the following 
# command using argunent supplied 
# du -h /dir | sort -hr | head

#To display disk usgae of all directories and files when only 2 args 
# are supplied and one of them is "-d"
if [ $# -eq 2 ] && [ $1=="-d" ] && [ -d $2 ]; then
    sudo du -a -h $2 | sort -rh 
fi

if [ $# -eq 3 ] && [ $1=="-n" ] && [ $2 -gt 0 ]; then
    sudo du -h $3 | sort -rh | head -$2
elif [ $#!="-n" ] && [ $#!="-d" ]; then
    sudo du -h $2 | sort -rh | head -8
fi
