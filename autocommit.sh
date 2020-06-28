#!/bin/sh
set -eu

# ----------
#
# Arguments:
#     $1 execution space
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
    return 0
}

move $1
commit $(currentDate '%F %R')