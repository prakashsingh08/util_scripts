#!/bin/bash
#gcloud compute instances describe dm-lle-mongo --zone us-central1-a --project kohls-mobile-lle 
a=(`kubectl get ns -o=custom-columns=NAME:.metadata.name`)

for name_space in "${a[@]:1}"
do
 # echo "NameSpace: $name_space "

  kubectl get po    -n $name_space  -o=custom-columns="":".metadata.namespace","":.metadata.name,"":.spec.containers[0].resources.limits.memory,"":.spec.containers[0].resources.limits.cpu
done
