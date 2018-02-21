#!/bin/bash

array=(`gcloud container clusters  list --format="csv(name)" |awk '{if(NR>1)print}'`)
array2=(`gcloud container clusters  list --format="csv(zone)" |awk '{if(NR>1)print}'`)

echo "name,enabled,max_node_count,min_node_count"
for index in ${!array[*]}; do

gcloud container clusters describe ${array[$index]} --zone ${array2[$index]} --format="csv(name,nodePools.autoscaling.enabled,nodePools.autoscaling.maxNodeCount,nodePools.autoscaling.minNodeCount)" |awk '{if(NR>1)print}'

gcloud beta container clusters get-credentials ${array[$index]} --zone ${array2[$index]} --project kohls-mobile-hle > /dev/null 2>&1
node_count=`kubectl get no |wc -l`
echo "CURRENT_NODE_COUNT:$node_count"
kubectl get no

done

