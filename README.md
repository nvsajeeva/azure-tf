# azure-tf

## Get the credentials

```
az aks get-credentials --resource-group resourcegroupname --name clustername
```

## Helm wordpress

```
https://github.com/bitnami/charts/tree/main/bitnami/wordpress

helm pull oci://registry-1.docker.io/bitnamicharts/wordpress --untar
helm install wordpress ./helm/wordpress/
```

## TLS & Ingress

```
helm repo add jetstack https://charts.jetstack.io
helm search repo cert-manager
helm pull jetstack/cert-manager:0.12.2 --untar
helm install cert-manager ./helm/cert-manager --install --create-namespace --wait --namespace cert-manager --set installCRDs=true

```

https://docs.bitnami.com/tutorials/secure-wordpress-kubernetes-managed-database-ssl-upgrades/

https://docs.bitnami.com/kubernetes/apps/wordpress/administration/enable-tls-ingress/

https://cert-manager.io/docs/tutorials/getting-started-aks-letsencrypt/
