source "${TEST_DIR}/funcs.bash"

test_start "Scripting Support" \
    "Trailing spaces should be eliminated by your command line tokenization process"

expected=$(sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null)
actual=$(timeout 2 ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null) || test_end

compare <(echo "${expected}") <(echo "${actual}")

test_end
