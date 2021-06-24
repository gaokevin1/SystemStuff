source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
cat /etc/passwd | sort | sed s/:.*//
echo -----
cat /etc/passwd | sort | sed s/:.*// | grep $(whoami)
echo -----
cat /etc/passwd | sort | grep s | sed s/:.*// | tail -n 3 | head -n 2
echo -----
echo hi | cat | cat | cat | cat | sed s/h/y/g | sed s/i/o/g | shuf
EOM
)

test_start "Long pipeline (several pipes in a single command)"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
