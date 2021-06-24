source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
oewiofjweoiwje
owfjeiowej
owjefiowejfiwoeewoijwio
ojwfe
cd /this/is/invalid
pwd
cd /usr/bin
./pwd
cd ../..
ls
cd
pwd
 
EOM
)

test_start "'cd' built-in command"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end 1
compare <(echo "${expected}") <(echo "${actual}")

test_end
