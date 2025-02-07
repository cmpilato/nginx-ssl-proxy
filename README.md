# nginx-ssl-proxy

Quickly stand up Nginx in a Docker Compose stack configured to serve as an
SSL-terminating proxy for the site of your choice.

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
