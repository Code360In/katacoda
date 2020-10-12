source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -F __start_kubectl k

kubectl wait --for=condition=ready node node01

kubectl apply -f https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/ingress/deploy-nginx-ingress-controller.yaml