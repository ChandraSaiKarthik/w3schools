#!/bin/bash

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

# Replace placeholders with actual values in files in the source directory
find "$source_dir" -type f -name "*.sql" -exec sed -i "s|$database_placeholder|$var_database_name|g;" {} \;
#find "$source_dir" -type f -name "*.sql" -exec sed -i "s|$log_file_dir_placeholder|$var_log_file_dir|g;" {} \;
#find "$source_dir" -type f -name "*.sql" -exec sed -i "s|$buffer_file_dir_placeholder|$var_buffer_file_dir|g;" {} \;

# Pause function
pause() {
    echo "Replaced PlaceHolders in *.sql files in the source directory.."
    echo "Press Any Key to Return to Main Process..."
    read -r
}
pause