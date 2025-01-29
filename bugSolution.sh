#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file safely using flock
safe_write() {
  local file=$1
  local message=$2
  flock -x "$file" || exit 1
  echo "$message" >> "$file"
  flock -u "$file"
}

# Write to file1.txt
safe_write file1.txt "Process 1 writing to file1.txt"
safe_write file1.txt "Process 2 writing to file1.txt"

# Write to file2.txt
safe_write file2.txt "Process 1 writing to file2.txt"
safe_write file2.txt "Process 2 writing to file2.txt"

# Print the content of the files.
echo "Content of file1.txt:"
cat file1.txt
echo "Content of file2.txt:"
cat file2.txt