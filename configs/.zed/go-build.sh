#!/usr/bin/env bash

dirname="$ZED_WORKTREE_ROOT"

cd "$dirname" && (
    go build -o /dev/null "./..."
)

exit $?
