#!/usr/bin/env bash

PROJECT_DIR=$1
GIT_DIR="$PROJECT_DIR/.git"
HOOK_DIR="$GIT_DIR/hooks"
BACKUP_DIR="$GIT_DIR/hooksbackup"
HOOK_DIRECTORY_SOURCE=`pwd`/hooks
