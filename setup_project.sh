#!/usr/bin/env bash

set -e #In this command the -e will stop the script from running if it encounters an error

Hault_capture_and_archive(){ echo -e "\n a problem is encountered.\nArchiving progress !!!"
if [ -d "$main_dir" ]; 
then 
tar -czf "${main_dir}_archive" $main_dir
rm -rf "$main_dir"
echo "a failed directory renewed.workspace archived"${main_dir}_archive
fi
exit 1

}
trap Hault_capture_and_archive SIGINT

# This is the part of the script that collects a directory name from the user and  creates a directory

read -p "Enter a directory name:" from_user
mkdir attendance_tracker_$from_user
main_dir = attendance_tracker_$from_user #storing the long parent directory in the main_dir for simplification.

cp attendance_checker.py  $main_dir/

mkdir -p $main_dir/Helpers

cp {assets.csv,config.json} $main_dir/Helpers/

mkdir -p $main_dir/reports 
cp reports.log $main_dir/reports/
# This is the part where the scripts ask if the user wants to change thre treshold values in the config.json

read -p "Do you want to change the treshhold values? (Yes(Y)/No(N))" answer

if [[ $answer =~ ^[Yy]$ ]];
then	
read -p "Enter your preferred warning value:(default value is 75)" warning_value
read -p "Enter your preferred failure value:(default value is 50) " failure_ value

#This part of the script will use the sed command to reset treshold value 

sed -i "s/\"warning\":[[:space:]][0-9]*/\"warning\": ${warning_value:-75} "$main_dir/Helpers/config.json

sed -i "s/\"failure\":[[:space:]][0-9]*/\"failure\": ${failure_value:-50} "$main_dir/Helpers/config.json
fi
#This part of the script will run a a check to see if python is installed
echo "Running a background health check !!!"
echo "Checking if python exist in your environment"

if python3 --version &>/dev/null;
then
echo "All is good, $(python3 --version) is installed"
else 
echo "Health check fail, python3 is not found"
fi
# This part of the script will verify the project structure, if it is as required

echo "Running checks to validate the project structure"
if [ -f "$main_dir/attendance_checker.py" ] && [ -d "$main_dir/Helpers" ] && [ -d "$main_dir/reports" ];
then
echo "You did right, Congratulations"
else
echo "Something went wrong, check it again"
fi
