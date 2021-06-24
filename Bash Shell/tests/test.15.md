## Test 15: Long pipeline (several pipes in a single command) [2 pts]

```

# ---------- Test Script ----------
echo "${script}"
cat /etc/passwd | sort | sed s/:.*//
echo -----
cat /etc/passwd | sort | sed s/:.*// | grep kevingao
echo -----
cat /etc/passwd | sort | grep s | sed s/:.*// | tail -n 3 | head -n 2
echo -----
echo hi | cat | cat | cat | cat | sed s/h/y/g | sed s/i/o/g | shuf
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

