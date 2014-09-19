docker-gen (nginx-proxy)
==========

This is a derived work from "jwilder/nginx-proxy", but
with an extra effort to split nginx and dockergen into
different containers, sharing a volume that holds the
dockergen output.

This is a good idea, because dockergen requires access
to its host's docker socket/binary. In this setup the
nginx container is as dumb as it gets (a good thing).

So here we have a "nginx-proxy" application made from
2 containers:

* **andrefernandes/docker-nginx** : generic nginx image
meant for reuse
* **andrefernandes/docker-gen** : specific-purpose image
meant to be plugged to a nginx image

### Useful scripts

* **build.sh** : builds the image locally (docker build)
* **runbash.sh** : convenient way to run commands on a new
container (fast-food, auto-destroy) or even to just
open a bash shell to play.
* **runweb.sh** : runs dockergen container as a daemon.

Please note that "runbash.sh" and "rungen.sh" assume that
there is a running "andrefernandes/docker-nginx" container
named "web" in order to mount its config volume.

### Fig

Multi-container applications benefit a lot from a higher-level
descriptor that defines their plumbing and automates deployment.

This is a whole new ground and there are several tools for that.
Fig is one of them and now fig is also a Docker product.

The file "nginx-proxy.yml" serves as an example and is quite
handy to run this particular 2-container application.

#### How can I use it?

    fig -f nginx-proxy.yml up

Can't get any simpler than that.

Well, actually it can, if you rename "nginx-proxy.yml" to just
"fig.yml":

    fig up

