source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
ls /
asdfghjklqprewopiqwualasdf # Bad Command!
# Comment only
pwd
EOM
)

test_start "Basic Memory Leak Check"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

valgrind --trace-children=no --leak-check=full \
    ./$SHELL_NAME < <(echo "${script}") 2>&1 \
    | grep 'are definitely lost'
[[ $? -eq 1 ]]

test_end
