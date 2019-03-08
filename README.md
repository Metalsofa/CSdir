# CS Homework Directory Manager
Bash script for easily downloading computer science course homework provided files and making the associated directories, in addition to navigating to them quickly from anywhere.

This script does nothing other than file management, conversion, and navigation; it does not interfere with or aid in software development.

Presently it only supports one CSCI class at a time.

## Installation ##
In bash, type the following commands from whatever directory you wish to install this to (mine is in the root because I'm lazy)
~~~~
$ git clone https://github.com/Metalsofa/DSdir
$ cd DSdir
$ chmod -x DSdir.sh
~~~~
Then, in your `.bashrc` file, add the following line at the bottom (or wherever your put your aliases):
~~~~
alias ds='cd {your installation directory}/DSdir/;. ./DSdir.sh'
~~~~
If you don't want to take up the name 'ds' for your aliases, you can change it to something else. This can always be changed later.

### Customization
Then it's time to make some customizations to the DSdir.sh file. Open it in your text editor of choice, and you should see some user-specific options that can be modified.
*  `dsdir` - Set this to your personal homework directory for the class
* `hwstring` - If you tend to name your homework folders something like 'hw1' or 'homework_1', then set this string to 'hw' or 'homework_', or whatever prefix you like.
* `zipstring` - If the provided files for each assignment are in the future kept in a zipfile called something other than "provided_files.zip", then you can change this to the appropriate name.
* `pdfstring` - If the homework instructions for each assignment are in the future in some pdf file called something other than 'hw.pdf', you can change this value to the appropriate file name.
* `dsclone` - If this is set to false, then the script will not automatically download the provided files for assignments. The script will instead simply make the directory without downloading anything.

Then you should be good to go!

## Usage
The syntax for this script is as follows:

`ds <hwnum>`

For example, `ds 3` will take me to the directory for homework 3.

If there is no such directory, it will ask whether you want to make a new one. If you do, and dsclone is set to `true`, it will ask for the link to the pdf associated with this homework, and then set up the directory automatically. It should also show you the converted pdf, and list the unzipped contents of the folder.

If dsclone is set to `false`, it will simply make the directory and navigate you to it. If you have the instructional pdf and/or provided zipfile in your Homework directory, it will move those to the new directory and unzip/convert them.b

### Also
If you use this script, and you use VIM, one additional functionality I reccomend is to bind a key to view the instructions. I have the following bind set:
~~~~
:nmap <C-h> :!less hw.txt<CR>
~~~~
Meaning that if I press ctrl-h while editing a file in this folder, I will see the instructions for this assignment in *less*. Obviously *less* must be installed for this to work.

## Necessary Packages
In order for this script to work, *less*, *head*, *tail*, and *pdftotext* should be installed. These are all fairly common packages.
