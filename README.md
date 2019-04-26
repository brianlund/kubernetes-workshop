# kubernetes-workshop
Scripts and manifests for demonstrating K8S basics

The files are specific to an environment featuring:

- [kiam](https://github.com/uswitch/kiam) for assigning IAM roles to pods
- [externaldns](https://github.com/kubernetes-incubator/external-dns) (or similar) for managing DNS on the fly
- [Application LoadBalancer Ingress controller](https://github.com/kubernetes-sigs/aws-alb-ingress-controller) for fulfilling the ingress


## Launching the stack


Anything enclosed in `< >` must be edited before usage.

*Create a namespace with an annotation for `kiam` allowing all roles to be assumed* 

`kubectl apply -f ns.yaml`

*Launch a pod with the IAM role specified with iam.amazonaws.com/role: <arn>*

`kubectl apply -f deployment.yaml`

*Launch a service with a selector targeting the pod(s) in the deployment*

`kubectl apply -f service.yaml`
	
*Launch an ingress resource to make the service available externally*

`kubectl apply -f ingress.yaml`
	

Check the namespace resources with: `kubectl get all -n <yournamespace>`

Ensure all pods are in `STATUS Running`


You can now access your service with the hostname you assigned in `ingress.yaml`


### Notes

The role assigned in `deployment.yaml` needs a trust policy that allows it to be assumed by the kubernetes workers your pods run on. See [https://github.com/uswitch/kiam/blob/master/docs/IAM.md](https://github.com/uswitch/kiam/blob/master/docs/IAM.md)

The image specified in `deployment.yaml` needs to be accessible to you, if you need an `imagePullSecret`to access it, then that secret must exist in your namespace. This is easily done by copying it from another namespace using
`kubectl get secret dockerhub-secret --namespace=<source-namespace> --export -o yaml |\
   kubectl apply --namespace=<destination-namespace> -f -`

The hostname assigned in `ingress.yaml` must be in a domain that externaldns can manage.
