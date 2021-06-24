## Test 02: Basic process execution both from PATH and with absolute path [3 pts]

```

# ---------- Test Script ----------
echo "${script}"

/bin/echo System Information
/bin/echo ------------------
/bin/echo -n Hostname: 
cat /proc/sys/kernel/hostname
echo -n Kernel Version: 
cat /proc/sys/kernel/osrelease
echo Logged in Users:
who
 
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
if [[ $? -eq 124 ]]; then
    test_end 1 # Exit status 124 means execution timed out
fi

compare <(echo "${expected}") <(echo "${actual}")
echo "${expected}"

echo "${actual}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------
System Information                     |
------------------                     <
Hostname:-n Kernel Version:            <
Logged in Users:                       <
kevingao console  Apr  5 15:46         <
kevingao ttys000  Apr  6 16:38         <
tput cols
---------------------------------------^---------------------------------------

test_end
```

