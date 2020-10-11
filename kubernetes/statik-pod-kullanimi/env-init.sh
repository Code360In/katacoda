source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -F __start_kubectl k

ssh node01 mkdir -p /root/.kubectl
scp /root/.kubectl/config root@node01:/root/.kubectl/config