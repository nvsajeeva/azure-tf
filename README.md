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
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ingress bitnami/nginx-ingress-controller
kubectl get svc ingress-nginx-ingress-controller -o jsonpath="{.status.loadBalancer.ingress[0].ip}"

helm repo add jetstack https://charts.jetstack.io
helm search repo cert-manager
helm pull jetstack/cert-manager:0.12.2 --untar
helm install cert-manager ./helm/cert-manager --install --create-namespace --wait --namespace cert-manager --set installCRDs=true

```

```
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
  labels:
    name: letsencrypt-prod
spec:
  acme:
    email: EMAIL-ADDRESS
    privateKeySecretRef:
      name: letsencrypt-prod
    server: https://acme-v02.api.letsencrypt.org/directory
    solvers:
    - http01:
        ingress:
          class: nginx
```

```
helm install wordpress bitnami/wordpress
  --set service.type=ClusterIP
  --set ingress.enabled=true
  --set ingress.certManager=true
  --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod
  --set ingress.hostname=DOMAIN
  --set ingress.extraTls[0].hosts[0]=DOMAIN
  --set ingress.extraTls[0].secretName=wordpress.local-tls
```

## References

https://docs.bitnami.com/tutorials/secure-wordpress-kubernetes-managed-database-ssl-upgrades/

https://docs.bitnami.com/kubernetes/apps/wordpress/administration/enable-tls-ingress/

https://cert-manager.io/docs/tutorials/getting-started-aks-letsencrypt/
