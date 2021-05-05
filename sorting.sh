#!/bin/bash

set -xe

for i in `cat prilog.txt`;
do
	touch $i;
	osmiBr=$(echo ${i:7:1})
	petiBr=$(echo ${i:5:1})
	convertOsmiBr=$(echo $((16#"$osmiBr")))
	xBr=$((convertOsmiBr-1))
	if [ $xBr -lt 0 ]
	then
		xBr=0
	fi
	if (( $convertOsmiBr % 2 == 0  )); then
		if ! [ -d "$osmiBr"0"$petiBr"0"" ]
		then
			mkdir $osmiBr"0"$petiBr"0"
		fi
		mv $i $osmiBr"0"$petiBr"0"
	else
		convertxBr=$(printf '%x\n' $xBr)
		if ! [ -d "$convertxBr"0"$petiBr"0""  ]
		then
			mkdir $convertxBr"0"$petiBr"0"
		fi
		mv $i $convertxBr"0"$petiBr"0"
	fi	
done;
