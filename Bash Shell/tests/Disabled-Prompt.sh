source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
mkdir -p ${HOME}/shell-test-temporary/a/long/directory
cd ${HOME}/shell-test-temporary/a/long/directory
cd ${HOME}
rm -r ${HOME}/shell-test-temporary/a/long/directory
mkdir -p /tmp/home/$(whoami)/test
cd /tmp/home/$(whoami)/test
cd /etc
cd /usr/bin
EOM
)

test_start "Prompt. NOTE: will fail if 'cd' is not implemented."

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

output=$(fake_tty ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

# Get lines that have a dollar sign. If not found, test fails.
prompt_lines=$(echo "${output}" | grep '\$') || test_end 1 ; echo $prompt_lines

# First prompt line:
first=$(echo "${prompt_lines}" | head -n1)
echo ${first}

# Does it have the username? (test will end if not)
timeout 2 grep "$(whoami)" <<< "${first}" &> /dev/null || test_end 1

# Does it have the hostname? (test will end if not)
timeout 2 grep "$(hostname)" <<< "${first}" &> /dev/null || test_end 1

# The first prompt line should have the first command number (0).
timeout 2 grep "0" <<< "${first}" &> /dev/null || test_end 1

# Now for the CWD printout. We should be able to find the following directories
# in the output.

timeout  2 grep '~/shell-test-temporary/a/long/directory' <<< "${prompt_lines}" \
    || test_end 1

timeout 2 grep ":/tmp/home/$(whoami)/test" <<< "${prompt_lines}" || test_end 1

timeout 2 grep ':/etc' <<< "${prompt_lines}" || test_end 1

timeout 2 grep ':/usr/bin' <<< "${prompt_lines}" || test_end 1

test_end
