#start cluster
minikube start

kubectl cluster-info

minikube status

kubectl apply -f kube

kubectl get pods --watch

minikube service knote --url

kubectl delete -f kube

kubectl scale --replicas=2 deployment/knote

minikube stop
