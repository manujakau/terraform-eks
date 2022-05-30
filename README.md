## terraform-eks
![terraform-eks](https://user-images.githubusercontent.com/44127516/170949279-49f4e4d1-a4f0-44f9-86c8-c5ffdf872226.jpg)

```
instance_tenancy : makes instances share on the host.
enable_dns_hostnames : eks requrement
enable_dns_support : eks requrement
```
```
CNI : Container network interface -:Amazon EKS supports native VPC networking with the Amazon VPC Container Network Interface (CNI) plugin for Kubernetes. This plugin assigns a private IPv4 or IPv6 address from your VPC to each pod.
```

```
eks nodes capacity_type : ON_DEMAND, SPOT
```

```
config credentials to ~/.kube/config
aws eks --region eu-north-1 update-kubeconfig --name eks --profile default
```

```
kubectl apply -f /home/<user>/terraform-eks/k8s-build-spec/app.yaml
```