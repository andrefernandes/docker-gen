#!/bin/bash
docker-gen -watch -only-exposed -notify "/app/reload-nginx-container.sh" /app/nginx.tmpl /etc/nginx/sites-enabled/default
