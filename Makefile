create-cluster:
	./bin/kops.sh -p vj -b vj-1111-vj-kops

delete-cluster:
	./bin/kops.sh -p vj -a delete -b vj-1111-vj-kops

deploy-prereq:
	helm upgrade --install ingress-nginx ingress-nginx \
		--repo https://kubernetes.github.io/ingress-nginx \
		--namespace ingress-nginx --create-namespace

deploy-external-dns:
	helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
	helm repo update external-dns
	helm upgrade --install external-dns external-dns/external-dns -f ./demo-apps/values-external-dns.yaml

deploy-cert-manager:
	helm repo add jetstack https://charts.jetstack.io
	helm repo update jetstack
	helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0 \
  --set installCRDs=true

$ FIXME: Add instructions for this
demo-cluster-autoscaler:
	echo Not implemented!

demo-external-dns:
	kubectl apply -f ./demo-apps/demoapp-deployment.yaml

demo-cert-manager:
	echo Not implemented!
	kubectl apply -f ./demo-apps/cert-manager-tls-demo.yaml
