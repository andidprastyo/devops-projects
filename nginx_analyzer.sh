LOG_FILE=${1:-nginx-access.log}
 
if [ ! -f "$LOG_FILE" ]; then
    echo "File not found: $LOG_FILE"
    exit 1
fi
 
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
 
echo
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
 
echo
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
 
echo
echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | sed 's/^ *\([0-9]*\) \(.*\)/\2 - \1 requests/'
