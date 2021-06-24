## Test 21: Quote support [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh test1 test2 'this is a single quoted test'
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh test1 test2 "this is a single quoted test"
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh 'test1 test2'
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh "test1 test2"
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh 'test1 "test2" test3' "test4 'test5' test6"
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh 'test'
/Users/kevingao/Downloads/P2/tests/scripts/num-args.sh
echo "Take a look at these quotes"
echo 'Are they "amazing" or what?!'
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
Number of args: 3                         Number of args: 3
Number of args: 3                         Number of args: 3
Number of args: 1                         Number of args: 1
Number of args: 1                         Number of args: 1
Number of args: 2                         Number of args: 2
Number of args: 1                         Number of args: 1
Number of args: 0                         Number of args: 0
Take a look at these quotes               Take a look at these quotes
Are they "amazing" or what?!              Are they "amazing" or what?!
tput cols
---------------------------------------^---------------------------------------

test_end
```

