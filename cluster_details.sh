#!/bin/bash

array=(`gcloud container clusters  list --format="csv(name)" |awk '{if(NR>1)print}'`)
array2=(`gcloud container clusters  list --format="csv(zone)" |awk '{if(NR>1)print}'`)


for index in ${!array[*]}; do

gcloud container clusters describe ${array[$index]} --zone ${array2[$index]} --format="csv(name,nodePools.autoscaling.enabled,nodePools.autoscaling.maxNodeCount,nodePools.autoscaling.minNodeCount)"

done

