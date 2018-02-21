#!/bin/bash
zone=$1
array=(`gcloud compute instances list   --format="csv(name)"  |grep -v "gke-"`)
array2=(`gcloud compute instances list   --format="csv(MACHINE_TYPE)"  |grep -v "gke-"|sed 's/ /_/g'|sed 's/\,//g'`)
array3=(`gcloud compute instances list   --format="csv(zone)"  |grep -v "gke-"`)
for index in ${!array[*]}; do

echo "${array[$index]}"@"${array2[$index]}"@"${array3[$index]}"

done

