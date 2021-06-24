## Test 12: History Execution !! [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
set -o history    # Your shell can ignore this
set -o histexpand # Your shell can ignore this
ls -1 -t -r /
!!
uname -a
!!
oeiwiowejweo
!!
echo Goodbye
!!
# -------------- End --------------

expected=$(HISTFILE=/dev/null HISTSIZE=100 bash \
    < <(echo "${script}") 2> /dev/null)
HISTFILE=/dev/null HISTSIZE=100 bash     < <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

