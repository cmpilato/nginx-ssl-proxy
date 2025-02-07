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

# Instructions

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
