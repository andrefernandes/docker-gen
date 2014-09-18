#!/bin/bash
CID=$(docker inspect --format "{{ .Id }}" web)
docker kill --signal="SIGHUP" $CID

