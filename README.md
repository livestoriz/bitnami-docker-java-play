[![CircleCI](https://circleci.com/gh/bitnami/bitnami-docker-java-play/tree/master.svg?style=shield)](https://circleci.com/gh/bitnami/bitnami-docker-java-play/tree/master)
[![Slack](http://slack.oss.bitnami.com/badge.svg)](http://slack.oss.bitnami.com)

# Bitnami Play Development Container

## TL;DR;

### Local workspace

```bash
$ mkdir ~/myapp && cd ~/myapp
$ curl -LO https://raw.githubusercontent.com/bitnami/bitnami-docker-java-play/master/docker-compose.yml
$ docker-compose up
```

## Why use Bitnami Images?

* Bitnami closely tracks upstream source changes and promptly publishes new versions of this image using our automated systems.
* With Bitnami images the latest bug fixes and features are available as soon as possible.
* Bitnami containers, virtual machines and cloud images use the same components and configuration approach - making it easy to switch between formats based on your project needs.
* Bitnami images are built on CircleCI and automatically pushed to the Docker Hub.
* All our images are based on [minideb](https://github.com/bitnami/minideb) a minimalist Debian based container image which gives you a small base container image and the familiarity of a leading linux distribution.

## Introduction

[Play Framework](https://www.playframework.com) makes it easy to build web applications with Java & Scala. Play is based on a lightweight, stateless, web-friendly architecture.

The Bitnami Play Development Container has been carefully engineered to provide you and your team with a highly reproducible Play development environment. We hope you find the Bitnami Play Development Container useful in your quest for world domination. Happy hacking!

[Learn more about Bitnami Development Containers.](https://docs.bitnami.com/containers/how-to/use-bitnami-development-containers/)

## Getting started

The quickest way to get started with the Bitnami Play Development Container is using [docker-compose](https://docs.docker.com/compose/).

Begin by creating a directory for your Play application:

```bash
mkdir ~/myapp
cd ~/myapp
```

Download the [docker-compose.yml](https://raw.githubusercontent.com/bitnami/bitnami-docker-java-play/master/docker-compose.yml) file in the application directory:

```bash
$ curl -LO https://raw.githubusercontent.com/bitnami/bitnami-docker-java-play/master/docker-compose.yml
```

Next, launch the Play application development environment using:

```bash
$ docker-compose up
```

The above command creates a container service for Play development and bootstraps a new Play application, named `myapp` in working directory. You can use your favorite IDE for developing the application.

After the application server has been launched, visit http://localhost:9000 in your favorite web browser and you'll be greeted the Play welcome page.

## Executing commands

Commands can be launched inside the `myapp` Play Development Container with `docker-compose` using the [exec](https://docs.docker.com/compose/reference/exec/) command.

> **Note**:
>
> The `exec` command was added to `docker-compose` in release [1.7.0](https://github.com/docker/compose/blob/master/CHANGELOG.md#170-2016-04-13). Please ensure that you're using `docker-compose` version `1.7.0` or higher.

The general structure of the `exec` command is:

```bash
$ docker-compose exec <service> <command>
```

, where `<service>` is the name of the container service as described in the `docker-compose.yml` file and `<command>` is the command you want to launch inside the service.

Because of the way Activator works with directories, we'll simply get inside the container and perform operations from there!

```bash
$ docker-compose run myapp bash
```

Now were in! To create a new Play Scala project

```bash
$ activator new bitnamiRocks play-java
```

Then you may want to have a look at the ui

```bash
$ cd bitnamiRocks
$ activator ui -Dhttp.host=0.0.0.0
```

Finally you can serve your app:

```bash
$ activator run -Dhttp.host=0.0.0.0
```

## Issues

If you encountered a problem running this container, you can file an [issue](../../issues/new). For us to provide better support, be sure to include the following information in your issue:

- Host OS and version (`uname -a`)
- Docker version (`docker version`)
- Docker info (`docker info`)
- Docker image version (`echo $BITNAMI_IMAGE_VERSION` inside the container)
- Steps to reproduce the issue.

## Community

Most real time communication happens in the `#containers` channel at [bitnami-oss.slack.com](http://bitnami-oss.slack.com); you can sign up at [slack.oss.bitnami.com](http://slack.oss.bitnami.com).

Discussions are archived at [bitnami-oss.slackarchive.io](https://bitnami-oss.slackarchive.io).

## License

Copyright (c) 2015-2016 Bitnami

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
