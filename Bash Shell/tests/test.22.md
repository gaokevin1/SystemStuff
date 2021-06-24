## Test 22: Environment Variable Expansion with Quotes [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
echo "SHELL is $SHELL"
echo "PATH is $PATH"
echo "TESTVAR is $TESTVAR"
echo "And all of them together looks like: $SHELL $PATH $TESTVAR -- wow!"
echo "! $END !"
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
SHELL is /bin/bash                     |  SHELL is $SHELL
PATH is /Library/Frameworks/Python.fra |  PATH is $PATH
TESTVAR is super awesome test variable |  TESTVAR is $TESTVAR
And all of them together looks like: / |  And all of them together looks like: $
! The End !                            |  ! $END !
tput cols
---------------------------------------^---------------------------------------

test_end
```

