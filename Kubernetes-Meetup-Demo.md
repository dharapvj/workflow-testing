# Kubernetes on Autopilot

# Pre-requisits
* A working Kubernetes cluster on public cloud, preferably on AWS. Can be created via KOPS.
* nginx ingress controller to deploy few apps accessible from internet.
* (optional) ArgoCD deployment on the cluster so that we can deploy apps via ArgoCD apps manifest.
TODO: May be use flatcar image
TODO: EKS support, Kubeone support - especially, ec2 instance profiles.. so that we don't need kube2iam.
TODO: Add Cluster creation steps. Initially for KOPS. Kops is not the most used platform anymore i guess.

# Automate reacting to variable compute power needs by using ClusterAutoscaler
TODO: Add commands for scaling deployment.
TODO: Modify ClusterAutoscale params so that it start reflecting to your request quickly

# Automate DNS name creation by using tools like External-DNS
TODO: Add commands to create required role for ec2 instances.

```shell
# Deploy external-dns helm chart
make deploy-external-dns

# Deploy the app which makes use of external DNS name in ingress
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
