## POD with iam dependency 

This is a docker image that demonstrates a simple nginx service with runtime dependencies to a protected AWS service, and hence the need for an IAM role.
The IAM role is assigned with [kiam](https://github.com/uswitch/kiam) when the right annotation is present on the pod.

When starting, the container will write the effective IAM role (if any) to /usr/share/nginx/html/index.html



