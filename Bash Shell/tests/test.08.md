## Test 08: ^C should be ignored by the shell [1 pts]

NOTE: this test runs in scripting mode; make sure the prompt is not printed by SIGINT handler

```

output=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"

compare <(echo "It worked") <(echo "${output}")
echo "It worked"

echo "${output}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------
It worked                              |
tput cols
---------------------------------------^---------------------------------------

test_end
```

