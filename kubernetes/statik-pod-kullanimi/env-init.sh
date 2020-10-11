source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -F __start_kubectl k

ssh node01 mkdir -p /root/.kube
scp /root/.kube/config root@node01:/root/.kube/config