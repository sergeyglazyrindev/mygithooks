#!/usr/bin/env bash

alert(){
    w -hs $USER |awk '{ print $2 }' | xargs -n1 -I{} sh -c "echo \"\\033[0;31m${1}\\033[0m\" > /dev/{}"
}

std_alert(){
    echo -e "\033[0;31m${1}\033[0m" >&2
}
