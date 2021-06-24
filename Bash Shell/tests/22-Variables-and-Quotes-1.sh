source "${TEST_DIR}/funcs.bash"

export TESTVAR="super awesome test variable"
export END="The End"
script=$(cat <<"EOM"
echo "SHELL is $SHELL"
echo "PATH is $PATH"
echo "TESTVAR is $TESTVAR"
echo "And all of them together looks like: $SHELL $PATH $TESTVAR -- wow!"
echo "! $END !"
EOM
)

test_start "Environment Variable Expansion with Quotes"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

compare <(echo "${expected}") <(echo "${actual}")

test_end
