#!/bin/bash

PASS=Abhi\!101010
REPO=abhisha7/jenkins-repo 

echo "packing the app in image"

docker-compose build



echo "tagging the image"

docker tag $JOB_NAME:$BUILD_NUMBER $REPO:${BUILD_NUMBER}

echo "loging to docker hub"

docker login -u abhisha7 -p $PASS

echo "Pushing image to docker registry"

docker push $REPO:$BUILD_NUMBER

echo "image is pushed to docker hub"
