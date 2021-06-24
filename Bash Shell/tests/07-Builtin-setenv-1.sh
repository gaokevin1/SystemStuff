source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
setenv shell_test_variable_1 This-is-a-really-long-environment-variable-value
setenv lions
setenv shell_test_variable_2 Tigers
setenv shell_test_variable_3 Toitles
setenv
${TEST_DIR}/scripts/print-env.sh
echo Test Complete
EOM
)

expected=$(cat <<EOM
This-is-a-really-long-environment-variable-value
Tigers
Toitles
Test Complete
EOM
)

test_start "setenv built-in command"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
