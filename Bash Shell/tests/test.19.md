## Test 19: Background job list [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
sleep 1 &
sleep 2 &
sleep 500 &
sleep 100 &
sleep 450 &
sleep 3
jobs
/Users/kevingao/Downloads/P2/tests/scripts/kill-parent.sh
# -------------- End --------------

actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)
./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
# Interrupt

# We remove:
# - pids (unique on each system)
# - & (optional to display in the job list)
# - leading and trailing spaces
actual=$(awk '{$1=""; $0=$0; print $0}' <<< "${actual}" \
    | sed -e 's/&//g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
awk '{$1=""; $0=$0; print $0}' <<< "${actual}"     | sed -e 's/&//g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'

compare <(echo "${expected}") <(echo "${actual}")
echo "${expected}"

echo "${actual}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------
sleep 500                                 sleep 500
sleep 100                                 sleep 100
sleep 450                              <
tput cols
---------------------------------------^---------------------------------------

test_end
```

