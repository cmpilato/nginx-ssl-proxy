#!/bin/sh

# Generate a self-signed certificate for the server
mkdir /usr/share/nginx/custom-certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=${CERT_COUNTRY:-US}/O=${CERT_ORGANIZATION:-cmpilato}/CN=${BACKEND_HOST}" \
        -keyout /usr/share/nginx/custom-certs/cert.key \
        -out    /usr/share/nginx/custom-certs/cert.crt
