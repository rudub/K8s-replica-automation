#!/bin/bash
export KUBECONFIG=$KUBECONFIG:/var/lib/jenkins/.kube/config

for i in `kubectl get ns | awk '{print $1}' | grep -v "kube"| grep -v "default" | grep -v "NAME"`; 
do  
    for j in `kubectl get deploy -n $i | awk '{print $1}' | grep -v "NAME"`; 
    do
    	echo $j
        echo `kubectl scale --replicas=2 deployment $j -n $i`  
    done;
done
