## Test 17: Piping and redirecting a whole, whole lot of times... [1 pts]

```

# (script hidden for brevity)

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end
./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
compare <(echo "${expected}") <(echo "${actual}")

echo "${expected}"
echo "${actual}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------

tput cols
---------------------------------------^---------------------------------------

test_end
```

