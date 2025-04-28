# MyGrep (mini grep clone)

This project is a basic version of the `grep` command, written in bash.

## Features
- Search for a string (case-insensitive).
- Print matching lines from a text file.
- Options:
  - `-n`: Show line numbers.
  - `-v`: Invert match (show lines that do NOT match).
- Combinations like `-vn`, `-nv` supported.
- `--help` option for usage info.

## Files
- `mygrep.sh` — the shell script.
- `testfile.txt` — sample text file for testing.

## Usage

```bash
chmod +x mygrep.sh

# Search normally
./mygrep.sh hello testfile.txt

# Search with line numbers
./mygrep.sh -n hello testfile.txt

# Invert match with line numbers
./mygrep.sh -vn hello testfile.txt

# Missing search string example (should show error)
./mygrep.sh -v testfile.txt
