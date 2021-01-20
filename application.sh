kubectl create deployment demo --image=rahulwagh17/kubernetes:jhooq-k8s-springboot
kubectl get deployments
kubectl expose deployment demo --type=ClusterIP --name=demo-service  --port=8080
kubectl get service demo-service

