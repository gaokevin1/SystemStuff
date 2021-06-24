source "${TEST_DIR}/funcs.bash"

export TESTVAR="super awesome test variable"
script=$(cat <<"EOM"
echo SHELL is
echo $SHELL
echo PATH is
echo $PATH
echo TESTVAR is
echo $TESTVAR
EOM
)

test_start "Environment Variable Expansion"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

compare <(echo "${expected}") <(echo "${actual}")

test_end
