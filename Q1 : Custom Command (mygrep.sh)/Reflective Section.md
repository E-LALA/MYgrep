 1. How the Script Handles Arguments and Options
The script checks if the correct arguments are provided. If not, it shows a help message.
It supports the --help option to show usage instructions and exit.
It uses getopts to handle options:
-n → Shows line numbers with the matching lines.
-v → Inverts the match (shows lines that do not match the search string).
After options are parsed, it expects a search string and a filename.
It checks if the file exists and reads it line by line:
If the line matches (case-insensitive), it shows it.
If -v is used, it shows lines that don't match.
If -n is used, it shows the line numbers.
# -----------------------------------------------------------------------------------------------------------------------------------------------------
  2. Changes for Supporting Regex or -i/-c/-l Options
If more options like regex, -i, -c, or -l were added:
Regex: Use grep -E for regex matching.
-i (ignore case): Add a flag to use -i for case-insensitive matching.
-c (count matches): Count the number of matches and print the total.
-l (list filenames): Print the filename if there’s a match, instead of the matching lines.
The script would need to:
Add more options in getopts.
Change the grep command dynamically based on the options.
Split the code into smaller functions to keep it organized.
# -------------------------------------------------------------------------------------------------------------------------------------------------------
 3. The Hardest Part to Implement
The hardest part was:
Correctly handling the options with getopts, especially when options like -vn or -nv are used together.
Managing the arguments and checking for the right search string and filename.
Mimicking the output of grep, especially with things like line numbers and inverted matches.
