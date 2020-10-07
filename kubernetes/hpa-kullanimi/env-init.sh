source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -F __start_kubectl k

METRICS_SERVER_RELEASE=$(curl --silent "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
curl -L https://github.com/kubernetes-sigs/metrics-server/releases/download/${METRICS_SERVER_RELEASE}/components.yaml | sed s/'args:'/'args:\n          - --kubelet-insecure-tls'/ | kubectl apply -f -

curl -L https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/hpa/ornek-uygulama.yaml -o ornek-uygulama.yaml