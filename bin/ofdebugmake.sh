#!/bin/bash
scan-build-8 make Debug  -j4 -s 2>&1 || exit 1
DIR="${PWD##*/}_debug"

if [ $? == 0 ]
then
	cd bin
	gdb $DIR
else
	echo "Compilation Failed!"
fi
exit
