# Kubernetes on Autopilot

## Pre-requisites
* A working Kubernetes cluster on public cloud, preferably on AWS. Can be created via KOPS.
* nginx ingress controller to deploy few apps accessible from internet.
* (optional) ArgoCD deployment on the cluster so that we can deploy apps via ArgoCD apps manifest.

TODO: EKS support, Kubeone support - especially, ec2 instance profiles.. so that we don't need kube2iam.

## Automate reacting to variable compute power needs by using ClusterAutoscaler

```shell
# Deploy demo application for cluster-autoscaler
make demo-cluster-autoscaler

# to demonstrate autoscaling...
# in one window
k logs -n kube-system -f -l app=cluster-autoscaler | grep -i scale_up
# in another window
kubectl scale deploy sleepy-deployment --replicas 40
```

## Automate DNS name creation by using tools like External-DNS

TODO: Add commands to create required role for ec2 instances.

```shell
# Deploy nginx ingress and external-dns helm chart
make deploy-prereq deploy-external-dns

# Deploy the app which makes use of external DNS name in ingress
# in one window
k logs -f -l app.kubernetes.io/name=external-dns
# in another window
make demo-external-dns
```
validate the DNS record in Route53
access http://demo-app.demo.dreamit.ltd in browser

# Automate TLS certificate generation and application to ingress via tools like cert-manager
```shell
# Deploy external-dns helm chart
make deploy-cert-manager

# Deploy the app which makes use of external DNS name in ingress
make demo-cert-manager
```
validate the DNS record in Route53
validate certificate CR in kubernetes cluster
access http://tls.demo.dreamit.ltd in browser
