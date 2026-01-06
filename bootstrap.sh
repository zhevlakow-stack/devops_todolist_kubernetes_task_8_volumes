#!/bin/bash

# 1. Create Namespace (if not exists)
kubectl create namespace todoapp --dry-run=client -o yaml | kubectl apply -f -

# 2. Apply Storage Resources
kubectl apply -f pv.yml
kubectl apply -f pvc.yml

# 3. Apply Configuration
kubectl apply -f configMap.yml
kubectl apply -f secret.yml

# 4. Apply Application
kubectl apply -f deployment.yml

echo "Bootstrap finished. Resources applied to 'todoapp' namespace."