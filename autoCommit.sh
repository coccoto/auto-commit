#!/bin/bash
set -eu

#
# autoCommit.sh {ディレクトリ名} {ブランチ名}
#

# 引数チェック
if [ $# -ne 2 ]; then
    echo "実行方法: $0 {ディレクトリ名} {ブランチ名}"
    exit 1
fi

# 対象ディレクトリのパスを取得
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TARGET_DIR="$SCRIPT_DIR/../$1"

# 対象ディレクトリに移動
cd "$TARGET_DIR" || exit 1

# レポジトリに変更を反映
git switch "$2" || exit 1
if git diff --staged --quiet; then
    echo "全ての変更をステージングします"
    git add -A || exit 1
fi
git commit -m "$(date +'%F %T')" || exit 1
git push origin "$2" || exit 1
