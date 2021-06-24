## Test 05: 'cd' built-in command [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
oewiofjweoiwje
owfjeiowej
owjefiowejfiwoeewoijwio
ojwfe
cd /this/is/invalid
pwd
cd /usr/bin
./pwd
cd ../..
ls
cd
pwd
 
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end 1
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

