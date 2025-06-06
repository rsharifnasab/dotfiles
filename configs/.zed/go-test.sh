#!/usr/bin/env bash

dirname="$ZED_WORKTREE_ROOT"

cd "$dirname" && (
    go test "./..." --count=0 || exit 1
    go test "./..." --count=1 -failfast
)

exit $?
