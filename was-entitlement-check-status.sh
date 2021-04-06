#!/bin/bash
while [ ! -f "/var/log/cloud-init-was.log" ]
do
    echo "waiting for was entitlement check started..."
    sleep 5
done

isDone=false
while [ $isDone = false ]
do
    result=`(tail -n1) </var/log/cloud-init-was.log`
    if [[ $result = Unentitled ]] || [[ $result = Entitled ]]; then
        isDone=true
    else
        echo "waiting for was entitlement check completed..."
        sleep 5
    fi
done
echo $result
