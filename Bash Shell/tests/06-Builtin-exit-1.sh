source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
echo Easiest point...
echo ...ever!
exit
echo If this prints, then exit
echo definitely isn't working!
EOM
)

test_start "'exit' built-in command"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end 1
compare <(echo "${expected}") <(echo "${actual}")

test_end
