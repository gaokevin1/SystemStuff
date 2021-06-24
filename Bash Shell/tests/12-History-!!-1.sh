source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
set -o history    # Your shell can ignore this
set -o histexpand # Your shell can ignore this
ls -1 -t -r /
!!
uname -a
!!
oeiwiowejweo
!!
echo Goodbye
!!
EOM
)

test_start "History Execution !!"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(HISTFILE=/dev/null HISTSIZE=100 bash \
    < <(echo "${script}") 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end

compare <(echo "${expected}") <(echo "${actual}")

test_end
