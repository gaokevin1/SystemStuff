## Test 07: setenv built-in command [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
setenv shell_test_variable_1 This-is-a-really-long-environment-variable-value
setenv lions
setenv shell_test_variable_2 Tigers
setenv shell_test_variable_3 Toitles
setenv
/Users/kevingao/Downloads/P2/tests/scripts/print-env.sh
echo Test Complete
# -------------- End --------------

actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

