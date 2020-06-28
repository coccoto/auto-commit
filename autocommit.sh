#!/bin/sh
set -eu

# ----------
#
# Arguments:
#     $1 execution space
#     $2 = 1 branch name
#
# ----------

#
# Arguments:
#     $1 execution space
#
function move() {
    cd ..
    cd $1
    return 0
}

#
# Arguments:
#     $* date format
#
function currentDate() {
    echo $(date +"$*")
    return 0
}

#
# Arguments:
#     $* commit message
#
function commit() {
    git add -A
    git commit -m "$*"
    echo 
    return 0
}

#
# Arguments:
#     $1 branch name
#
function push() {
    git push origin $1
    return 0
}

move $1
commit $(currentDate '%F %R')

isPush=${2:-1}

if [ isPush != 1 ]; then
    push $2
fi