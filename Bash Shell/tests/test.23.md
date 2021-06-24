## Test 23: Basic Memory Leak Check [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
ls /
asdfghjklqprewopiqwualasdf # Bad Command!
# Comment only
pwd
# -------------- End --------------

valgrind --trace-children=no --leak-check=full \
    ./$SHELL_NAME < <(echo "${script}") 2>&1 \
    | grep 'are definitely lost'
echo "${script}"
[[ $? -eq 1 ]]

test_end
```

