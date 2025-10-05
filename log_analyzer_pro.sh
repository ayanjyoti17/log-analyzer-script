#!/bin/bash

# --- 1. Safety Checks ---
# Check if a log file was provided as an argument.
if [ -z "$1" ]; then
  echo "Error: Please provide the path to a log file."
  echo "Usage: $0 <path-to-logfile>"
  exit 1
fi

LOG_FILE=$1

# Check if the log file actually exists.
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File not found at '$LOG_FILE'"
    exit 1
fi

# --- 2. The Analysis Pipeline ---
# The core of this script is a reusable command pipeline that we'll apply
# to different parts of the log file. Here's how it works:
#
# 1. 'extract_data'  : Pull out just the piece of info we want (e.g., IP addresses).
# 2. 'sort'           : Group all identical lines together.
# 3. 'uniq -c'        : Count how many times each unique line appears.
# 4. 'sort -rn'       : Sort the counts from highest to lowest.
# 5. 'head -n 5'      : Get just the top 5 lines.

# --- 3. Run the Analysis for Each Metric ---

echo "Analyzing log file: $LOG_FILE"
echo "=========================================="

# Top 5 IP Addresses
# awk '{print $1}' extracts the first column (the IP address).
echo "## Top 5 IP Addresses ##"
TOP_IPS=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5)
echo "$TOP_IPS"
echo ""

# Top 5 Most Requested Paths
# awk '{print $7}' extracts the seventh column (the URL path).
echo "## Top 5 Most Requested Paths ##"
TOP_PATHS=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5)
echo "$TOP_PATHS"
echo ""

# Top 5 Response Status Codes
# awk '{print $9}' extracts the ninth column (the status code).
echo "## Top 5 Response Status Codes ##"
TOP_CODES=$(awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5)
echo "$TOP_CODES"
echo ""

# Top 5 User Agents
# cut -d '"' -f 6 splits the line by the " character and takes the 6th field.
echo "## Top 5 User Agents ##"
TOP_AGENTS=$(cut -d '"' -f 6 "$LOG_FILE" | sort | uniq -c | sort -rn | head -n 5)
echo "$TOP_AGENTS"

echo "=========================================="
echo "Analysis Complete."

exit 0