source "${TEST_DIR}/funcs.bash"

test_start "History Execution !num"

expected=$(HISTFILE=/dev/null HISTSIZE=100 bash \
    < "${TEST_DIR}/scripts/history-script-2.sh" 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < "${TEST_DIR}/scripts/history-script-2.sh" \
    2> /dev/null) || test_end

compare <(echo "${expected}") <(echo "${actual}")

test_end
