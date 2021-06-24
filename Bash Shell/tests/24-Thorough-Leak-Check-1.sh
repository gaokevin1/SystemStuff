source "${TEST_DIR}/funcs.bash"

test_start "Thorough Memory Leak Check"

valgrind --trace-children=no --leak-check=full \
    ./$SHELL_NAME < "${TEST_DIR}/scripts/leak.sh" 2>&1 \
    | grep 'are definitely lost'
[[ $? -eq 1 ]]

test_end
