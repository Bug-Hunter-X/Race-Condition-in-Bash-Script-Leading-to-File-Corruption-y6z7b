# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a bash script.  Two processes concurrently attempt to write to the same files, resulting in unpredictable and potentially corrupted file contents.  The `bug.sh` script shows the buggy code, and `bugSolution.sh` offers a solution using locking mechanisms to prevent data corruption.

The race condition is a common concurrency problem that is often difficult to detect and debug. This example highlights the importance of using proper synchronization primitives when multiple processes or threads access shared resources.