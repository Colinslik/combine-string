#!/bin/sh

	    Kill_list1=($(ps -ef | grep '[q]sync ' | awk '{print $1}'))
        Kill_list2=($(ps -ef | grep '[q]syncd ' | awk '{print $1}'))
        combined=( "${Kill_list1[@]}" "${Kill_list2[@]}" )
        for j in "${combined[@]}"
        do
                echo "Kill proc $j"
                for((;;)); do
                        if [ $(ps -ef | awk '{print $1}' | grep $j) ] && [ "$(ps -ef | grep $j | grep -v grep | awk '{print $3}')" != "Z" ] && [ "$(ps -ef | grep $j | grep -v grep | awk '{print $4}')" != "Z" ]
                        then
                                kill -9 $j
                        else
                                break
                        fi
                        sleep 2
                done
        done

