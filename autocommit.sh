#!/bin/sh
set -eux

# ----------
#
# Arguments:
#     $1 execution space
#     $2 branch name
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
#     $1 branch name
#
function checkout() {
    git checkout $1
    return 0
}

#
# Arguments:
#     $1 date format
#     $2 date format
#
function currentDate() {
    echo $(date +"$1 $2")
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

#
# Arguments:
#     $1 branch name
#
function push() {
    git push origin $1
    return 0
}

move $1
checkout $2
commit $(currentDate %F %R)
push $2