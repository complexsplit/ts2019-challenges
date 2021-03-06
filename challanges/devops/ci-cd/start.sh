#!/bin/bash

kubectl delete -f k8s/deployment.yaml
kubectl delete -f k8s/service.yaml
kubectl delete -f k8s/ingress.yaml

kubectl apply -f k8s/deployment.yaml
kubectl rollout status deployment/jenkins
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
