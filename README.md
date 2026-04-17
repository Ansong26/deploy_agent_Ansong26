The script SETUP_PROJECT.SH is a  Bash scrip that  helps you quickly create a project folder for an attendance tracker. 

When you run the script, it will  asks you to type a name for your folder. 

It then creates a main folder called attendance_tracker_<THE NAME YOU ENTERED>.

Inside this folder, it copies a Python file called attendance_checker.py and creates two subfolders named Helpers and reports.

It also copies important files like assets.csv, config.json, and reports.log into the correct places,that is it will put assests.csv and config.json in the Helpers directory.

The script has a safety feature called a trap, which means if you stop the script (for example by pressing Ctrl + C), it will save your work by compressing the folder into an archive file and then remove the incomplete folder.


You will also be asked if you want to change threshold values (numbers that decide warning and failure limits) inside the config.json file. 

At the end, the script checks if Python is installed and makes sure all folders and files were created correctly.

REMEMBER: This script should be run in a folder that already contains all the required files.
