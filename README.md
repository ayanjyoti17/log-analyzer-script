# Log File Analyzer

A Bash script that analyzes Nginx log files to provide a summary of website traffic. It takes a log file as an argument and reports on total requests, successful vs. failed requests, and the most frequently visited URLs.

This project is part of the roadmap.sh DevOps project series.

## Requirements
Create a shell script that reads the log file and provides the following information from the logfile:
-   Top 5 IP addresses with the most requests
-   Top 5 most requested paths
-   Top 5 response status codes
-   Top 5 user agents

## How to Use

1.  **Clone or download** the `log_analyzer.sh` script.
2.  **Make it executable:** `chmod +x log_analyzer.sh`
3.  **Run the script** with the path to your log file:
    ```sh
    ./log_analyzer.sh /path/to/your/access.log
    ```

---

**Project Page URL:** https://roadmap.sh/projects/nginx-log-analyser