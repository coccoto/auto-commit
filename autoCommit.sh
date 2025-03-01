#!/bin/bash
set -eu

#
# autoCommit.sh {ディレクトリ名} {ブランチ名}
#

function checkout() {
    git checkout "$1"
}

function commit() {
    git add -A || exit 1
    git commit -m "$(date +'%F %T')" || exit 1
}

function push() {
    git push origin "$1" || exit 1
}

# 本スクリプトファイルのディレクトリをセットする
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 作業対象のディレクトリをセットする
TARGET_DIR="$SCRIPT_DIR/../$1"

# 作業対象のディレクトリに移動する
cd "$TARGET_DIR" || exit 1

# 処理を開始する
set +e
checkout "$2"
set -e
commit
push "$2"
