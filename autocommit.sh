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
#     $1 date format
#
function currentDate() {
    echo $(date +"$1")
    return 0
}

#
# Arguments:
#     $1 commit message
#
function commit() {
    git add -A
    git commit -m "$1"
    return 0
}

move $1
commit $(currentDate '%F %R')