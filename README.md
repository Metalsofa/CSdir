# CS Homework Directory Manager (Linux)
Bash script for easily downloading computer science course homework provided files and making the associated directories, in addition to navigating to them quickly from anywhere.

This script does nothing other than file management, conversion, and navigation; it does not interfere with or aid in software development.

Presently it only supports one CSCI class at a time.

## Installation ##
*Note: This will not run properly if you do not have the required packages, listed at the bottom of this README document*

First navigate in bash to whatever directory you wish to install this to, then enter the following commands from there.

~~~~
git clone https://github.com/Metalsofa/CSdir
cd CSdir
chmod -x CSdir.sh
~~~~
Then, in your `.bashrc` file (easily accessible by typing `vim .bashrc` while in the root), add the following line at the bottom (or wherever your put your aliases), of course **modified to the location you chose** (The final folder in the path should still be 'CSdir' since that's the repository name):
~~~~
alias csdir='cd /path/to/installation/directory/CSdir/;. ./CSdir.sh'
~~~~
If you don't want to take up the name 'csdir' for your aliases (or if you maybe want something shorter), you can change it to something else. This can always be changed later.

**If you ever get tired of having this command available, just delete this line.**

Also, you'll have to close and re-open the shell in order for this aliasing to take effect.

Next be sure to follow the *customization* steps, because the default values for this probably won't perfectly line up with your setup or the file structure you have in mind.

### Customization
It's time to make some customizations to the CSdir.sh file (located wherever you cloned the repository to in step 1). Open it in your text editor of choice, and you should see some user-specific options that can be modified.
* `hwdir` - Set this to your personal homework directory for the class
* `hwstring` - If you tend to name your homework folders something like 'hw1' or 'homework_1', then set this string to 'hw' or 'homework_', or whatever prefix you like.
* `zipstring` - If the provided files for each assignment are kept in a zipfile called something other than "provided_files.zip", then you can change this to the appropriate name.
* `pdfstring` - If the homework instructions for each assignment are in some pdf file called something other than 'hw.pdf', you can change this value to the appropriate file name.
* `autoclone` - If this is set to false, then the script will not automatically download the provided files for assignments. The script will instead simply make the directory without downloading anything.

Then you should be good to go!

## Usage
To activate this script, just type the following command from any directory:

`csdir <hwnum>`

For example, `csdir 3` will take me to the directory for homework 3, if there is one.

If there is no such directory, it will ask whether you want to make a new one. If you do, and dsclone is set to `true`, it will ask for the link to the pdf associated with this homework, and then set up the directory automatically. It should also show you the converted pdf, and list the unzipped contents of the folder.

If csclone is set to `false`, it will simply make the directory and navigate you to it. If you have the instructional pdf and/or provided zipfile in your Homework directory, it will move those to the new directory and unzip/convert them.b

### Also
If you use this script, and you use VIM, one additional functionality I reccomend is to bind a key to view the instructions. I have the following bind set:
~~~~
:nmap <C-h> :!less hw.txt<CR>
~~~~
Meaning that if I press ctrl-h while editing a file in this folder, I will see the instructions for this assignment in *less*. Obviously *less* must be installed for this to work.

## Necessary Packages
In order for this script to work, *less*, *head*, *tail*, and *pdftotext* should be installed. These are all fairly common packages.
