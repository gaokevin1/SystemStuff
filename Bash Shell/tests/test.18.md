## Test 18: Background job support [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
/Users/kevingao/Downloads/P2/tests/scripts/sleeper.sh 500 &
/Users/kevingao/Downloads/P2/tests/scripts/sleeper.sh 100 &
/Users/kevingao/Downloads/P2/tests/scripts/sleeper.sh 85 &
/Users/kevingao/Downloads/P2/tests/scripts/sleeper.sh 450 &
echo Done
/Users/kevingao/Downloads/P2/tests/scripts/kill-parent.sh
# -------------- End --------------

actual=$(timeout 1 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end 1
timeout 1 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
```

