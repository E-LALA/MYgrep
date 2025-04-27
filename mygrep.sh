#!/bin/bash

# Function to print usage information
print_usage() {
    echo "Usage: $0 [-n] [-v] search_string filename"
    echo
    echo "Options:"
    echo "  -n    Show line numbers for each matching line."
    echo "  -v    Invert match (show non-matching lines)."
    echo "  --help    Display this help and exit."
}

# Check if no arguments are given
if [[ $# -lt 1 ]]; then
    echo "Error: No arguments provided."
    print_usage
    exit 1
fi

# Handle --help
if [[ "$1" == "--help" ]]; then
    print_usage
    exit 0
fi

# Initialize flags
show_line_numbers=false
invert_match=false

# Parse options
while getopts ":nv" opt; do
    case $opt in
        n) show_line_numbers=true ;;
        v) invert_match=true ;;
        \?) echo "Invalid option: -$OPTARG" >&2
            print_usage
            exit 1 ;;
    esac
done

# Shift parsed options
shift $((OPTIND -1))

# Check if we have enough arguments left
search_string="$1"
filename="$2"

if [[ -z "$search_string" || -z "$filename" ]]; then
    echo "Error: Missing search string or filename."
    print_usage
    exit 1
fi

# Check if file exists
if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Read file and search
line_number=0
while IFS= read -r line; do
    ((line_number++))
    if echo "$line" | grep -iq "$search_string"; then
        matched=true
    else
        matched=false
    fi

    if { [[ $matched == true ]] && [[ $invert_match == false ]]; } || \
       { [[ $matched == false ]] && [[ $invert_match == true ]]; }; then
        if [[ $show_line_numbers == true ]]; then
            echo "${line_number}:$line"
        else
            echo "$line"
        fi
    fi
done < "$filename"
