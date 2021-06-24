## Test 01: Scripting Support [1 pts]

Trailing spaces should be eliminated by your command line tokenization process

```

expected=$(sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null)
sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null
actual=$(timeout 2 ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null) || test_end
timeout 2 ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null
```

