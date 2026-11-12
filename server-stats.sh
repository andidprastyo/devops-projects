echo "=== CPU Usage ==="
top -bn1 | grep "Cpu(s)"

echo
echo "=== Memory Usage ==="
free -m | awk '/Mem:/ {print "Used: " $3 " MB (" $3*100/$2 "%)  Free: " $2-$3 " MB (" ($2-$3)*100/$2 "%)"}'

echo
echo "=== Disk Usage Percentage ==="
df -h /

echo
echo "=== Top 5 Processes by CPU ==="
ps aux --sort=-%cpu | head -n 6

echo
echo "=== Top 5 Processes by Memory ==="
ps aux --sort=-%mem | head -n 6

