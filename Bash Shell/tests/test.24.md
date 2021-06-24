## Test 24: Thorough Memory Leak Check [1 pts]

```

valgrind --trace-children=no --leak-check=full \
    ./$SHELL_NAME < "${TEST_DIR}/scripts/leak.sh" 2>&1 \
    | grep 'are definitely lost'
[[ $? -eq 1 ]]

test_end
```

