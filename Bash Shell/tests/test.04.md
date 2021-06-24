## Test 04: Comment support [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
#Here's a comment
# Here's another
        # And another one! ####
echo Line 1 # This better not display
echo Line 2 #There's nothing here! #  echo No way
##################
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

