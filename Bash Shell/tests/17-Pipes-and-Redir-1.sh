source "${TEST_DIR}/funcs.bash"


script=$(cat <<EOM
ls -1 /bin | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n-1 | tail -n+2 | head -n 10 | tail -n 5 > ${TEST_DIR}/mega-output.txt
cat ${TEST_DIR}/mega-output.txt
rm ${TEST_DIR}/mega-output.txt
EOM
)

test_start "Piping and redirecting a whole, whole lot of times..."

# (script hidden for brevity)

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
