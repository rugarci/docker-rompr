# docker-rompr

[![Latest Github release](https://img.shields.io/github/release/rugarci/docker-rompr.svg)](https://github.com/rugarci/docker-rompr/releases/latest)
[![Image size](https://img.shields.io/docker/image-size/rugarci/rompr/latest)](https://hub.docker.com/r/rugarci/rompr)
[![Docker Pulls](https://img.shields.io/docker/pulls/rugarci/rompr.svg)](https://hub.docker.com/r/rugarci/rompr)

RompR Docker image.

Built on Alpine and running Apache+PHP7.
This only includes RompR.
There is no built-in database other than using the built-in SQLite, but connecting to a Mysql DB can be configured at startup.
For now, all the Apache defaults are used.

Tested on Raspberry Pi 4

## Usage

```bash
docker run rugarci/rompr
```