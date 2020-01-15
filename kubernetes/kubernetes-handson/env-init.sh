cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: handson
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: api-service-account
  namespace: handson
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  name: api-access
  namespace: handson
rules:
  -
    apiGroups:
      - ""
      - apps
      - autoscaling
      - batch
      - extensions
      - policy
      - rbac.authorization.k8s.io
    resources:
      - componentstatuses
      - configmaps
      - daemonsets
      - deployments
      - events
      - endpoints
      - horizontalpodautoscalers
      - ingress
      - jobs
      - limitranges
      - namespaces
      - nodes
      - pods
      - persistentvolumes
      - persistentvolumeclaims
      - resourcequotas
      - replicasets
      - replicationcontrollers
      - serviceaccounts
      - services
    verbs: ["*"]
  - nonResourceURLs: ["*"]
    verbs: ["*"]
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: api-access
  namespace: handson
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: api-access
subjects:
- kind: ServiceAccount
  name: api-service-account
  namespace: handson
---
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: kubernetes-handson
  name: kubernetes-handson
  namespace: handson
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kubernetes-handson
  template:
    metadata:
      labels:
        app: kubernetes-handson
    spec:
      serviceAccountName: api-service-account
      containers:
      - image: enterprisecodingcom/kubernetes-handson
        name: kubernetes-handson
        ports:
        - containerPort: 80
          name: http-port
---
apiVersion: v1
kind: Service
metadata:
    name: kubernetes-handson
    namespace: handson
spec:
  ports:
    - name: http-port
      port: 80
      targetPort: 80
      nodePort: 30006
  selector:
    app: kubernetes-handson
  type: NodePort
EOF

while [[ $(kubectl get pods -n handson -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "." && sleep 1; done