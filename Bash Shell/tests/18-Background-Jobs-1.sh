source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
${TEST_DIR}/scripts/sleeper.sh 500 &
${TEST_DIR}/scripts/sleeper.sh 100 &
${TEST_DIR}/scripts/sleeper.sh 85 &
${TEST_DIR}/scripts/sleeper.sh 450 &
echo Done
${TEST_DIR}/scripts/kill-parent.sh
EOM
)

test_start "Background job support"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

actual=$(timeout 1 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end 1

compare <(echo "Done") <(echo "${actual}")

test_end
