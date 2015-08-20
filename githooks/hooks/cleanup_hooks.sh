#!/bin/bash
mkdir -p ~/log
LOG_FILE=~/log/up.`date +%Y-%m-%d.%H-%M-%S`.log
echo "Updating dependencies... To monitoring run command:"
echo "tail -f ${LOG_FILE}"

. `dirname $BASH_SOURCE`/../includes/alert_functions.sh
. `dirname $BASH_SOURCE`/../includes/venv_functions.sh

cleanup_alert(){
    msg="$1 Check log file ${LOG_FILE}"
    alert "$msg"
}


main(){
    trap "" HUP
    cd `dirname $BASH_SOURCE`/../../
    echo "Current working directory: "`pwd`
    activate_venv

    echo "Update requirements..."
    REQUIREMENTS_CHANGED=`diff <(pip freeze |sed 's/===/==/') <(cat requirements.txt | sed '/^$/d' | sed 's/^.*#egg=//' | sort) | sed 's/^> #.*$//' | grep -E '>'`
    if [ -n "$REQUIREMENTS_CHANGED" ]; then
	pip install -r requirements.txt
	if [ $? != 0 ]; then
            cleanup_alert "UNABLE UPDATE REQUIREMENTS!!!"
            return 1
	fi
    fi

    echo "Clean *.pyc files..."
    find -L -name "*.pyc" -delete
    
    # echo "Apply migrations..."
    # python manage.py migrations apply
    # if [ $? != 0 ]; then
    #     cleanup_alert "UNABLE APPLY MIGRATIONS!!!"
    #     return 1
    # fi
    if [ -f project-reload ]; then
        echo "Restarting uwsgi..."
        touch project-reload
    fi
}

main > $LOG_FILE 2>&1&
