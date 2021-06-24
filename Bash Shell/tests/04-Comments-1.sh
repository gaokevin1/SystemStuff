source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
#Here's a comment
# Here's another
        # And another one! ####
echo Line 1 # This better not display
echo Line 2 #There's nothing here! #  echo No way
##################
EOM
)

test_start "Comment support"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
