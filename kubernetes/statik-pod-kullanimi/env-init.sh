source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -F __start_kubectl k

ssh node01 mkdir -p /root/.kubect
scp /root/.kubect/config root@node01:/root/.kubect/config