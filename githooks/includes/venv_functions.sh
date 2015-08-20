#!/usr/bin/env bash

activate_venv() {
    if [[ -z $VIRTUAL_ENV ]]; then
        echo 'Activate virtualenv...'
        source `which virtualenvwrapper.sh`
	PROJECT_DIR=`dirname $BASH_SOURCE` /../../
	VENV=`cat $PROJECT_DIR/.venv`
        workon $VENV
    fi
}
