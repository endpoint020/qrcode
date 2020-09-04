#!/bin/bash
period=5
root_path="/var/cache/nfdump/flows/live/669D4D56AA5EB102D33206B20E6D771F"
dest_path="/mnt/nsf"

function get_file_path(){
    now=$(date +%s)
    pre_tamp=`expr $now - 60 \* $1`
    pre_time=$(date -d@$pre_tamp +%s)
    pre_date=$(date -d@$pre_time  '+%Y-%m-%d')
    pseconds=$(date -d@$pre_time  '+%H:%M:%S'|awk -F":" '{print $1*3600+$2*60+$3}')
    phours=`expr $pseconds / 3600`
    pmin=`expr $pseconds % 3600 / 60 / $1`
    per_min=`expr $pmin \* $1`
    if [ "$phours" -lt 10 ];then
        phours="0"$phours
    fi
    if [ "$per_min" -lt 10 ];then
    per_min="0"$per_min
    fi
    time=$(date -d@$pre_time  '+%Y%m%d')$phours$per_min
    dir_path=$2"/"$pre_date
    file_path=$dir_path"/nfcapd."$time
    #echo $dir_path
    echo $file_path
}



echo "excute get_file_path function"
path=$(get_file_path $period $root_path)

echo $path





