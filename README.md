web-inventory
============

This image runs a web service in 8080 port, used for show microservice concept. It comes from rawmind/alpine-base.

## Build

```
docker build -t rawmind/web-inventory:<version> .
```

## Versions

- `0.1-1` [(Dockerfile)](https://github.com/rawmind0/web-inventory/blob/0.1-1/Dockerfile)


## Usage

```
docker run rawmind/web-inventory:<version> 
```

## Example

See [rancher-example][rancher-example], rancher catalog package that runs web-monolith in a cattle environment.

## Microservice uri

- / web-inventory app

[rancher-example]: https://github.com/rawmind0/web-inventory/tree/master/rancher