Attendance Tracker Setup Script
Overview
The script SETUP.SH is a Bash script that is  designed to automate the setup of an attendance tracking project. Instead of manually creating folders and copying files, the script does everything for you in a few steps. It builds a clean project structure, copies required files, allows optional configuration changes, and performs checks to make sure everything works correctly.

Features
1.Creates a main project directory with a custom name
2.Automatically organizes subfolders (Helpers and reports)
3.Copies all required project files into the correct locations
4.Allows users to update threshold values in the configuration file
5.Includes an error-handling system that saves progress if interrupted
6.Checks if Python is installed on the system
7.Validates the final project structure

Requirements
Before running this script, make sure you have:
a.A Unix-based system (Linux or macOS, or Windows with WSL)
b.Bash shell installed
c.Python 3 installed (python3)
d.The following files in the same directory as the script:
   i.attendance_checker.py
   ii.assets.csv
   iii.config.json
   iv.reports.log

Setup Instructions
1.Save the script into a file, for example:
setup.sh

2.Give the script permission to run (make it executable):
chmod +x setup.sh

3.Run the script:
./setup.sh

4.Enter a directory name when prompted.
Example:
Enter a directory name: my_project

(Optional) Choose whether to change threshold values:
Warning value (default: 75)
Failure value (default: 50)

Project Structure Created
After running the script, your project should look like this:

attendance_tracker_<The Name You Entered>/
│
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
│
└── reports/
    └── reports.log

How the Script Works
1. Script Start
The script begins with a shebang (#!/usr/bin/env bash), which tells the system to use Bash to run the script.
set -e ensures the script stops immediately if any command fails.
2. Error Handling (Trap)
A function is defined to handle unexpected interruptions.
The trap command listens for a signal (like pressing Ctrl + C).
If triggered:
The current project directory is compressed into an archive (.tar.gz)
The incomplete directory is removed
The script exits safely
3. User Input and Directory Creation
The script uses read -p to ask the user for a directory name.
It creates a main folder using mkdir.
Subfolders (Helpers and reports) are created using mkdir -p.
4. File Copying
The cp command copies required files into their correct locations:
Python script → main directory
CSV and JSON → Helpers folder
Log file → reports folder
5. Configuration Update
The user can choose to update threshold values.
If yes, the script uses sed (a text editing tool) to modify values inside config.json.
The /pattern/replacement/ format is used to find and replace numbers.
6. Python Check

The script checks if Python is installed using:

python3 --version
If Python is missing, it displays an error message.
7. Final Validation
The script verifies that all required files and folders exist.
It uses:
-f to check files
-d to check directories
A success or failure message is displayed

REMEMBER: This script should be run in a folder that already contains all the required files.
