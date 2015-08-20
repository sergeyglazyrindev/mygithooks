#!/usr/bin/env bash

. `dirname $BASH_SOURCE`/includes/install_variables.sh
. `dirname $BASH_SOURCE`/includes/alert_functions.sh

if [[ ! -h "$HOOK_DIR" ]] ; then
    std_alert "$HOOK_DIR is not a symbolic link. So, it seems like you have not installed these hooks. Run ./githooks/install.sh"
    exit 1
fi

rm $HOOK_DIR
mkdir "$HOOK_DIR"
cp $BACKUP_DIR/* $HOOK_DIR/
echo "Done"
