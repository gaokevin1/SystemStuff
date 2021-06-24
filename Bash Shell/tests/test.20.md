## Test 20: Environment Variable Expansion [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
echo SHELL is
echo $SHELL
echo PATH is
echo $PATH
echo TESTVAR is
echo $TESTVAR
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)
./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"

compare <(echo "${expected}") <(echo "${actual}")
echo "${expected}"

echo "${actual}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------
SHELL is                                  SHELL is
/bin/bash                                 /bin/bash
PATH is                                   PATH is
/Library/Frameworks/Python.framework/V    /Library/Frameworks/Python.framework/V
TESTVAR is                                TESTVAR is
super awesome test variable               super awesome test variable
tput cols
---------------------------------------^---------------------------------------

test_end
```

