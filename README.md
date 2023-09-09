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
