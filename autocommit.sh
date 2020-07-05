#!/bin/sh
set -eu

# ----------
# Arguments:
#     $1 - execution space
#     $2 - branch name
# ----------

#
# Arguments:
#     $1 - execution space
#
function move() {
    cd ..
    cd $1
    return 0
}

#
# Arguments:
#     $1 - last status
#
function isFirst() {
    if [ $1 = 1 ]; then
        read -p 'first commit? (yes or no): ' first
        errorHandle $first
    fi
    return 0
}

#
# Arguments:
#     $1 - flag
#
function errorHandle() {
    if [ $1 = 'no' ]; then
        set -e
        return 1
    fi
}

#
# Arguments:
#     $1 first date format
#     $2 last date format
#
function currentDate() {
    echo $(date +"$1 $2")
    return 0
}

#
# Git Command
#
# Arguments:
#     $1 - branch name
#
function checkout() {
    git checkout $1 2> /dev/null
    return $?
}

#
# Git Command
#
# Arguments:
#     $* - commit message
#
function commit() {
    git add -A
    git commit -m "$*"
    return 0
}

#
# Git Command
#
# Arguments:
#     $1 - branch name
#
function push() {
    git push origin $1
    return 0
}

move $1
set +e
checkout $2
isFirst $?
set -e
commit $(currentDate %F %R)
push $2