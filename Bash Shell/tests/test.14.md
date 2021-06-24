## Test 14: Pipe with a large amount of lines [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
seq 10000000 | wc -l
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

