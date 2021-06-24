## Test 03: Long command lines [1 pts]

```

timeout 15 ./$SHELL_NAME < "${TEST_DIR}/scripts/too-long.sh" &> /dev/null || test_end 1
```

