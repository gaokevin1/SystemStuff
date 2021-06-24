source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
seq 10000000 | wc -l
EOM
)

test_start "Pipe with a large amount of lines"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
