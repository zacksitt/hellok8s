#create service
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080

#export pod_name
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $PORT_NAME

#attach label
kubectl label pod $POD_NAME app=v1

#scale development
kubectl scale deployments/kubernetes-bootcamp --replicas=4

#export node_port
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

#update deployment image
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kub
ernetes-bootcamp:v2

#check rollout status
kubectl rollout status deployments/kubernetes-bootcamp

#rollout undo
kubectl rollout undo deployments/kubernetes-bootcamp

#Logs
kubectl logs -f podname
