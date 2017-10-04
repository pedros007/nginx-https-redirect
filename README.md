[Image on DockerHub](https://hub.docker.com/r/pedros007/nginx-https-redirect/)

Redirect HTTP traffic to HTTPS using nginx running on a small Alpine
Linux image.

I wrote this image to run as a service in
[AWS EC2 Container Service](https://aws.amazon.com/ecs/) to redirect
traffic from an
[AWS Application Load Balancer](https://aws.amazon.com/elasticloadbalancing/)
via an
[HTTP listener](http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html)
&
[Target Group](http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html).
However, this image should work on nearly any container management
platform.

