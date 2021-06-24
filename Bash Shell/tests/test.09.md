## Test 09: History List [1 pts]

```

expected=$(HISTFILE=/dev/null HISTSIZE=100 bash \
    < "${TEST_DIR}/scripts/history-script-1.sh" 2> /dev/null)
HISTFILE=/dev/null HISTSIZE=100 bash     < "${TEST_DIR}/scripts/history-script-1.sh" 2> /dev/null
actual=$(timeout 5 ./$SHELL_NAME < "${TEST_DIR}/scripts/history-script-1.sh" \
    2> /dev/null) || test_end
timeout 5 ./$SHELL_NAME < "${TEST_DIR}/scripts/history-script-1.sh"     2> /dev/null
```

