if [ $HOSTNAME == "controlplane" ]; then
    hostname k8s-node
else
    hostname rancher-node
fi