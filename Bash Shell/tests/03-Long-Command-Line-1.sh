source "${TEST_DIR}/funcs.bash"

test_start "Long command lines"

timeout 15 ./$SHELL_NAME < "${TEST_DIR}/scripts/too-long.sh" &> /dev/null || test_end 1
expected=$(sh < "${TEST_DIR}/scripts/long.sh" 2> /dev/null)
actual=$(timeout 15 ./$SHELL_NAME < "${TEST_DIR}/scripts/long.sh" 2> /dev/null) || test_end 1

compare <(echo "${expected}") <(echo "${actual}")

test_end
