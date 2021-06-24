## Test 13: Basic pipe support (single pipe) [1 pts]

```

# ---------- Test Script ----------
echo "${script}"
ls -1 / | sort
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
sh <(echo "${script}") 2> /dev/null
echo "${script}"
actual=$(./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end
./$SHELL_NAME < <(echo "${script}") 2> /dev/null
echo "${script}"
compare <(echo "${expected}") <(echo "${actual}")
echo "${expected}"

echo "${actual}"
tput cols
Expected Output                        | Actual Output
tput cols
---------------------------------------V---------------------------------------
Applications                              Applications
Desktop                                   Desktop
Groups                                    Groups
Library                                   Library
Network                                   Network
Shared Items                              Shared Items
System                                    System
User Information                          User Information
Users                                     Users
Volumes                                   Volumes
bin                                       bin
cores                                     cores
dev                                       dev
etc                                       etc
home                                      home
installer.failurerequests                 installer.failurerequests
john                                      john
kevingao                                  kevingao
net                                       net
opt                                       opt
private                                   private
sbin                                      sbin
tmp                                       tmp
usr                                       usr
var                                       var
tput cols
---------------------------------------^---------------------------------------

test_end
```

