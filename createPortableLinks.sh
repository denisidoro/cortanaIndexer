#!/bin/bash

searchedDir="/cygdrive/c/Portable/"

find $searchedDir -maxdepth 3 -type f \( -iname \*.exe -o -iname \*.bat \) -exec bash -c '

# variables
dest="/cygdrive/c/Users/Denis/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Administrative Tools"
nir="/cygdrive/c/Portable/Programming/CLI/nircmd/nircmd.exe"

# function to transform cygwin path to escaped win path
function r {
	result=$(cygpath -w "$1")
	replace="\\\\"
	result="${result//\\/$replace}"
	#replace="\ "
	#result="${result//\ /$replace}"
}

# get filename and extension
filename=$(basename "{}")
extension="${filename##*.}"
filename="${filename%.*}"

# set arguments
r "{}"
arg1="$result"
r "$dest"
arg2="$result"
r "$filename"
arg3="$result"

# final command
echo Creating shortcut for "$arg3"
#$nir shortcut "$arg1" "$arg2"\\\\ "$arg3" 

' \;

echo Finished
