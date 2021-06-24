source "${TEST_DIR}/funcs.bash"

trap '# Interrupt' INT

script=$(cat <<EOM
sleep 1 &
sleep 2 &
sleep 500 &
sleep 100 &
sleep 450 &
sleep 3
jobs
${TEST_DIR}/scripts/kill-parent.sh
EOM
)

expected=$(cat <<EOM
sleep 500
sleep 100
sleep 450
EOM
)

test_start "Background job list"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

# We remove:
# - pids (unique on each system)
# - & (optional to display in the job list)
# - leading and trailing spaces
actual=$(awk '{$1=""; $0=$0; print $0}' <<< "${actual}" \
    | sed -e 's/&//g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

compare <(echo "${expected}") <(echo "${actual}")

test_end
