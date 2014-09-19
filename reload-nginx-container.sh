#!/bin/bash
 
# RELOAD NGINX
echo "Reloading nginx, dumping env"
env
# tries to detect if we are NOT running under fig
if [[ "$PROXY_NAME" != "proxy_1" ]]
then
  # the form below does not work with fig
  # because name is dynamic
  CID=$(docker inspect --format "{{ .Id }}" $PROXY_NAME)
  docker kill --signal="SIGHUP" $CID
else
  # the form below works with fig, but detects container
  # name in an ugly way (whatever ends with "_proxy_1").
  # don't blame me, fig makes funny names
  FIGNAME=$(docker ps | grep "_proxy_1" | awk '{print $NF}')
  CID=$(docker inspect --format "{{ .Id }}" $FIGNAME)
  docker kill --signal="SIGHUP" $CID
fi

