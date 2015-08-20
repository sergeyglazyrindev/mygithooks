#!/usr/bin/env bash

. `dirname $BASH_SOURCE`/includes/install_variables.sh
. `dirname $BASH_SOURCE`/includes/alert_functions.sh

if [[ -h "$HOOK_DIR" ]] ; then
    std_alert "$HOOK_DIR is a symbolic link. Maybe you already installed hooks ?"
    exit 1
fi

mkdir "$BACKUP_DIR"
cp $HOOK_DIR/* $BACKUP_DIR/
rm -rf $HOOK_DIR
ln -s "$PROJECT_DIR/githooks/hooks/" "$HOOK_DIR"
echo "Done"
