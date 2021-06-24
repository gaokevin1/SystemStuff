source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
ls -1 / | sort
EOM
)

test_start "Basic pipe support (single pipe)"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
