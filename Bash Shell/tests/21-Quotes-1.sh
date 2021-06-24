source "${TEST_DIR}/funcs.bash"

export TESTVAR="super awesome test variable"
script=$(cat <<EOM
${TEST_DIR}/scripts/num-args.sh test1 test2 'this is a single quoted test'
${TEST_DIR}/scripts/num-args.sh test1 test2 "this is a single quoted test"
${TEST_DIR}/scripts/num-args.sh 'test1 test2'
${TEST_DIR}/scripts/num-args.sh "test1 test2"
${TEST_DIR}/scripts/num-args.sh 'test1 "test2" test3' "test4 'test5' test6"
${TEST_DIR}/scripts/num-args.sh 'test'
${TEST_DIR}/scripts/num-args.sh
echo "Take a look at these quotes"
echo 'Are they "amazing" or what?!'
EOM
)

test_start "Quote support"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

compare <(echo "${expected}") <(echo "${actual}")

test_end
