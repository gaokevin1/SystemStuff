source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM

/bin/echo System Information
/bin/echo ------------------
/bin/echo -n Hostname: 
cat /proc/sys/kernel/hostname
echo -n Kernel Version: 
cat /proc/sys/kernel/osrelease
echo Logged in Users:
who
 
EOM
)

test_start "Basic process execution both from PATH and with absolute path"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)
if [[ $? -eq 124 ]]; then
    test_end 1 # Exit status 124 means execution timed out
fi

compare <(echo "${expected}") <(echo "${actual}")

test_end
