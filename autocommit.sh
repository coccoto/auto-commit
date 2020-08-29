#!/bin/sh
set -eu

# ----------
# Arguments:
#     $1 - execution space
#     $2 - branch name
#     $3 - skip checkout flag = 0
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
# Git Command
#
# Arguments:
#     $1 - branch name
#     $2 - first commit check
#
function checkout() {
    if [ $2 = 0 ]; then
        git checkout $1
    fi
    return 0
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
checkout $2 ${3:-0}
commit $(currentDate %F %R)
push $2