#!/usr/bin/env bash

#new
#sudo systemctl start docker && echo "Starting docker daemon"
#sudo systemctl start docker | tee -a ~/log.txt

echo "Linting Code"
make lint

# Creating image path
imageName=moazario/siteimage:siteimage

if !(docker image ls | grep siteimage)
then 
    echo "Building Docker image from this directory"
    # Build image and add a descriptive tag
    docker build -t $imageName . | tee -a ~/log.txt
    

fi


echo "Listing existing docker images"
# List docker images
docker image ls | tee -a ~/log.txt


#export PATH=$PATH:./.ml-microservice/bin

echo "Starting Kubernetes"
minikube start --driver docker | tee -a ~/log.txt
sleep 1m

if(kubectl get pods | grep sitepod)
then 
    echo "Deleting running pod"
    kubectl delete pod sitepod | tee -a ~/log.txt
    sleep 1m
fi

echo "Running image inside sitepod"
# Run image inside a pod
sudo kubectl run sitepod --image $imageName | tee -a ~/log.txt
#kubectl run sitepod --image moazario/siteimage:siteimage
sleep 1m


echo "Listing existing pods"
# List kubernetes pods
kubectl get pods | tee -a ~/log.txt

sleep 2m

echo "Forwarding host port 8080 to container port 80"
# Forward Host port 8080 to container Port 80

#sudo cp -r ~/FinalProject-master/udacity/* /var/www/html/

sudo kubectl port-forward sitepod 80:80 --address 0.0.0.0 | tee -a ~/log.txt && (echo "Script ran successfully")
#kubectl port-forward sitepod 80:80 --address 0.0.0.0

