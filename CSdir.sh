#!/bin/bash
# User inputs an argument for this
hwnum=$1
#This is an unimplemented feature
vim=false

#------------USER-SPECIFIC OPTIONS------------
# Change this to your Homework path for the concerned class
hwdir="/mnt/c/ds/"

# Change this to the name of your course
coursename="Data Structures"

# Change this to the string you use to prefix your homeworks.
# If this is set to "hw", then it is assumed you name your homework folders
# as "hw1", "hw2", and so on.
hwstring="hw"

# Set this to whatever the current professor is calling the provided zipfile
# for each homework assignment. For me, it was "provided_files.zip"
zipstring="provided_files.zip"

# Set this to whatever the current professor is calling the provided pdf file
# For me, it was "hw.pdf"
pdfstring="hw.pdf"

# Set this to TRUE if you want to enable cloning provided files directly from the 
# course site, or FALSE if that scares you (no shame in that)
autoclone=true
#---------------------------------------------

if [ -d "$hwdir$hwstring$hwnum" ]; then
	echo "Now navigating to $coursename: Homework $hwnum"
	cd ~
	cd $hwdir$hwstring$hwnum
	#show the user wherest they are
	ls
	#open some stuff in VIM
	if [ -e "dshw.vim" ] && [ getopts "v" $vim ]; then
		#echo "VIM script detected for this assignment. Opening VIM now."
		vim main.cpp
	else
		if [ $vim ]; then
			echo "Could not find VIM script for this assignment"
		fi
	fi
else
	echo "No directory exists for Homework $hwnum"
	read -p "Create new directory? y/[n] " choice
	if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
		#Create the directory
		cd /mnt/c/workshop++/ds/
		mkdir $hwstring$hwnum
		echo "Created directory $hwdir$hwstring$hwnum"
		if [[ ! $autoclone ]]; then
			#Check if provided_files.zip is in the DS parent directory
			if [ -f "$zipstring" ]; then
				echo "Found $zipstring in $coursename directory"
				echo "Moving $zipstring to Homework $hwnum directory"
				mv "$zipstring" "$hwstring""$hwnum"/"$zipstring"
				echo "Unzipping provided files..."
				cd "$hwstring$hwnum"
				unzip "$zipstring"
				cd ..
			fi
			#Check if hw.pdf is in the DS parent directory
			if [[ -f "$pdfstring" ]]; then
				echo "Found $pdfstring in $coursename directory"
				echo "Moving $pdfstring to Homework $hwnum directory"
				mv "$pdfstring" "$hwstring""$hwnum"/"$pfdstring"
				echo "Converting $pdfstring to a text file..."
				cd "$hwstring$hwnum"
				pdftotext "$pdfstring"
				cd ..
			fi
			cd "$hwstring$hwnum"
		else
			#Move into the new directory
			cd $hwstring$hwnum
			#Prompt the user for the pdf link, infer where the zip is from that
			read -p "Paste the web-address of the provided PDF for this assignment: " webloc
			echo "Downloading $webloc to Homework $hwnum directory"
			#Download the file
			wget "$webloc"
			#Get the zipfile address for this homework from the PDF one
			webloc="${webloc%$pdfstring}$zipstring"
			echo "Downloading $webloc to Homework $hwnum directory"
			wget "$webloc"
			echo "Unzipping provided files..."
			unzip "$zipstring"
			echo "Converting $pdfstring to a text file..."
			pdftotext "$pdfstring"
			echo 
			echo "----------------------------------------hw.txt preview------------------------------------------"
			head "${pdfstring%pdf}txt"
			echo
			echo "..."
			echo
			tail "${pdfstring%pdf}txt"
			echo "------------------------------------------------------------------------------------------------"
			echo
		fi
		echo "Finished directory setup for Homework $hwnum"
		ls
	else
		cd -
	fi
fi
