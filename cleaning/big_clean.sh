#!/usr/bin/bash

function big_clean(){
	
	# Setting the a variable to the first command line (the tar file)
	Arch_Name=$1

	# setting up the basename system for the file
	Base_Name=$(basename -s .tgz "$Arch_Name")

	# Creating the temporary directory
	SCRATCH=$(mktemp -d)
	
	# Extract files to the temporary directory
	tar -vxf "$Arch_Name" -C "$SCRATCH"

	# Setting a variable as the directory for the moving phase
	DIR=$(pwd)

	# Cd'ing into the SCRATCH directory or exiting
	cd "$SCRATCH" || exit
	
	# Removing the files including "DELETE ME" with grep and xargs
	grep -Rl "DELETE ME" . | xargs rm

	
	# Re-compressing the file and adding the "cleaned" tag 
	tar -zcf cleaned_"$Arch_Name" "$Base_Name"

	# Moving the new cleaned file to the appropriate directory
	mv cleaned_"$Arch_Name" "$DIR" 	
}
big_clean $1
