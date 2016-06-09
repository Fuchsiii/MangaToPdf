#!/bin/bash

# MangaToPdf v1.0

mkdir -p convert
for d in */ 
do
	# folders
	if [ "$d" != "convert/" ]
	then
		echo "Processing ${d::-1}"
		command="convert "
	
		for i in `ls $d*.jpg | sort -V`
		do
			# files
			command="$command $i"
		done

		output="convert/${d::-1}.pdf"
		command="$command $output"
		
		if eval $command
		then
		        echo "Sucessfully processed ${d::-1}"
		else
		        echo "Error occurred while processing ${d::-1}"
		fi
	fi
done
