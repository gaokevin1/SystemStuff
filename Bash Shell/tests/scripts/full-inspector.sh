
echo System Information
echo ------------------
echo -n 'Hostname: '
cat /proc/sys/kernel/hostname
echo -n 'Kernel Version: '
cat /proc/sys/kernel/osrelease
echo -n Uptime: 
uptime -p
echo
echo Hardware Information
echo --------------------
echo -n 'CPU Model: '
grep 'model name' /proc/cpuinfo | head -n 1 | sed 's/.*://g'
echo -n 'Processing Units: '
grep 'processor' /proc/cpuinfo | wc -l
echo -n 'Load Average (1/5/15 min): '
awk '{print $1, $2, $3}' /proc/loadavg
echo -n 'CPU Usage: '
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
echo -n 'Memory Usage: '
top -bn1 | grep -o "\([0-9.]*\) used," | awk '{print $1, "MB"}'
echo
echo Task Information
echo ----------------
echo -n 'Tasks: '
ls -1 /proc | grep -E '^[0-9]+$' | wc -l
echo 'Since Boot:'
echo -n '    Interrupts: '
grep intr /proc/stat | awk '{print $2}'
echo -n '    Context Switches: '
grep ctxt /proc/stat | awk '{print $2}'
echo -n '    Forks: '
grep processes /proc/stat | awk '{print $2}'
echo
echo 'Task List'
echo '---------'
ps aux
