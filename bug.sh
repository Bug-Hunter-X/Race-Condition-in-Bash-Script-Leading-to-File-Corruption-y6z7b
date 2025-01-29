#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes that try to write to the same file concurrently.
process1() {
  echo "Process 1 writing to file1.txt" >> file1.txt
  echo "Process 1 writing to file2.txt" >> file2.txt
}

process2() {
  echo "Process 2 writing to file1.txt" >> file1.txt
  echo "Process 2 writing to file2.txt" >> file2.txt
}

# Run the processes concurrently.
process1 & process2 &
wait

# Print the content of the files.
echo "Content of file1.txt:"
cat file1.txt
echo "Content of file2.txt:"
cat file2.txt