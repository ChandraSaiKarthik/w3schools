#!/bin/bash

# Pause function
pause() {
    read -r
}

# Get the current directory from which the script is executed
source_dir=$(pwd)
echo "Source directory is: $source_dir"

# Define placeholders defined in files to be replaced
database_placeholder="<<Database>>"
log_file_dir_placeholder="<<LogFileDir>>"
buffer_file_dir_placeholder="<<BufferFileDir>>"

# Define variables to replace placeholders in files
var_database_name='w3schools'
var_log_file_dir='C:\Program Files (x86)\SQLserver\LogFiles\'
var_buffer_file_dir='C:\Program Files (x86)\SQLserver\BufferFiles\'

echo "Replacing <<Database>> :: $var_database_name"
#echo "Replacing <<LogFileDir>> :: $var_log_file_dir"
#echo "Replacing <<BufferFileDir>> :: $var_buffer_file_dir"
echo "Press Any Key to Continue..."
pause

# Replace placeholders with actual values in "*.sql and *.txt" files in the source directory
find "$source_dir" -type f \( -name "*.sql" -o -name "*.txt" \) -exec sed -i "s|$database_placeholder|$var_database_name|g;" {} \;
#find "$source_dir" -type f \( -name "*.sql" -o -name "*.txt" \) -exec sed -i "s|$log_file_dir_placeholder|$var_log_file_dir|g;" {} \;
#find "$source_dir" -type f \( -name "*.sql" -o -name "*.txt" \) -exec sed -i "s|$buffer_file_dir_placeholder|$var_buffer_file_dir|g;" {} \;

echo "Replaced PlaceHolders in *.sql and *.txt files in the source directory.."
echo "Press Any Key to Return to Main Process..."
pause