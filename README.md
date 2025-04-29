# nginx-ssl-proxy

Quickly stand up Nginx in a Docker Compose stack configured to serve
as an SSL-terminating proxy for the site of your choice.

# Description

This little Docker stack includes an Nginx image does the following on
each startup:

1.  Generates a self-signed certificate (using details from its
    environment).
2.  Modifies its server configuration to allow it to proxy requests to
    another server (as defined by its environment).

While, generally speaking, there is little value in using a self-signed
certificate &mdash; especially one that changes every time the container
starts &mdash; for the purposes of actual security, it can be useful in
lesser circumstances for testing purposes.

# Building/Starting the Stack

1. Build the Docker images.

```sh
$ docker compose build
...
```

2. Copy the environment template file into place.

```sh
$ cp env.tmpl .env
```

3. Modify the environment file to reflect your desired configuration.

```sh
$ vi .env
```

4. Run the Docker Compose stack.

```sh
$ docker compose up  # Add -d flag to run the stack backgrounded
...
```

# Accessing Your Proxied Content

The stack will expose port 8443 on your localhost.  So the most naive way
to access your proxied content is by replacing the original protocol, host,
and port with "https://localhost:8443".

For example, if you are trying to reach a service that lives at
`http://www.example.com:8080/services/my-service`, configure this stack with:

```
BACKEND_HOST=www.example.com
BACKEND_PROTO=http
BACKEND_PORT=8080
```

After starting the stack with this configuration, you should be able to access
that service at `https://localhost:8443/services/my-service`.

NOTE:  If you need to access your service from code running inside another
Docker stack, the typical transformations must be done.  Your other Docker
stack needs a way to address its host machine, for example with stanzas like
this on the relevant services:

```
    extra_hosts:
      - "host.docker.internal:host-gateway"
```

And then you'll need to have the code within that stack access your service
through _that_ hostname: `https://host.docker.internal:8443/services/my-service`.
