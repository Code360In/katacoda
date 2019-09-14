kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
export HELM_RELEASE=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)
curl https://get.helm.sh/helm-$HELM_RELEASE-linux-amd64.tar.gz -o helm-$HELM_RELEASE-linux-amd64.tar.gz
tar -zxvf helm-$HELM_RELEASE-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64/helm
rm -f helm-$HELM_RELEASE-linux-amd64.tar.gz
helm init --service-account tiller
while [[ $(kubectl get pods -l app=helm,name=tiller -n kube-system -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "." && sleep 1; done