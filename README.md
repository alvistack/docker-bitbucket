# Docker Image Packaging for Atlassian Bitbucket

[![Travis](https://img.shields.io/travis/com/alvistack/docker-bitbucket.svg)](https://travis-ci.com/alvistack/docker-bitbucket)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-bitbucket.svg)](https://github.com/alvistack/docker-bitbucket/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-bitbucket.svg)](https://github.com/alvistack/docker-bitbucket/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/bitbucket.svg)](https://hub.docker.com/r/alvistack/bitbucket/)

Bitbucket is an on-premises source code management solution for Git that's secure, fast, and enterprise grade. Create and manage repositories, set up fine-grained permissions, and collaborate on code - all with the flexibility of your servers.

Learn more about Bitbucket: <https://www.atlassian.com/software/bitbucket>

## Supported Tags and Respective `Dockerfile` Links

  - [`7.5`, `latest`](https://github.com/alvistack/docker-bitbucket/blob/master/molecule/7.5/Dockerfile.j3)
  - [`7.4`](https://github.com/alvistack/docker-bitbucket/blob/master/molecule/7.4/Dockerfile.j2)

## Overview

This Docker container makes it easy to get an instance of Bitbucket up and running.

Based on [Official Ubuntu Docker Image](https://hub.docker.com/_/ubuntu/) with some minor hack:

  - Minimized `Dockerfile` for meta data definition
  - Provision by Ansible and Molecule Docker driver in single layer
  - Handle `ENTRYPOINT` with [catatonit](https://github.com/openSUSE/catatonit)

### Quick Start

For the `Bitbucket_HOME` directory that is used to store the repository data (amongst other things) we recommend mounting a host directory as a [data volume](https://docs.docker.com/engine/tutorials/dockervolumes/#/data-volumes), or via a named volume if using a docker version \>= 1.9.

Volume permission is NOT managed by entry scripts. To get started you can use a data volume, or named volumes.

Start Atlassian Bitbucket Server:

    # Pull latest image
    docker pull alvistack/bitbucket
    
    # Run as detach
    docker run \
        -itd \
        --name bitbucket \
        --publish 7990:7990 \
        --publish 7999:7999 \
        --volume /var/atlassian/application-data/bitbucket:/var/atlassian/application-data/bitbucket \
        alvistack/bitbucket

**Success**. Bitbucket is now available on <http://localhost:7990>

Please ensure your container has the necessary resources allocated to it. We recommend 2GiB of memory allocated to accommodate both the application server and the git processes. See [Supported Platforms](https://confluence.atlassian.com/display/Bitbucket/Supported+Platforms) for further information.

### Memory / Heap Size

If you need to override Bitbucket's default memory allocation, you can control the minimum heap (Xms) and maximum heap (Xmx) via the below environment variables.

#### JVM\_MINIMUM\_MEMORY

The minimum heap size of the JVM

Default: `512m`

#### JVM\_MAXIMUM\_MEMORY

The maximum heap size of the JVM

Default: `1024m`

### Reverse Proxy Settings

If Bitbucket is run behind a reverse proxy server, then you need to specify extra options to make Bitbucket aware of the setup. They can be controlled via the below environment variables.

#### CATALINA\_CONNECTOR\_PROXYNAME

The reverse proxy's fully qualified hostname.

Default: *NONE*

#### CATALINA\_CONNECTOR\_PROXYPORT

The reverse proxy's port number via which Bitbucket is accessed.

Default: *NONE*

#### CATALINA\_CONNECTOR\_SCHEME

The protocol via which Bitbucket is accessed.

Default: `http`

#### CATALINA\_CONNECTOR\_SECURE

Set 'true' if CATALINA\_CONNECTOR\_SCHEME is 'https'.

Default: `false`

#### CATALINA\_CONTEXT\_PATH

The context path via which Bitbucket is accessed.

Default: *NONE*

### JVM configuration

If you need to pass additional JVM arguments to Bitbucket such as specifying a custom trust store, you can add them via the below environment variable

#### JVM\_SUPPORT\_RECOMMENDED\_ARGS

Additional JVM arguments for Bitbucket

Default: `-Datlassian.plugins.enable.wait=300`

### Misc configuration

Other else misc configuration.

#### TZ

Default timezone for the docker instance

Default: `UTC`

#### SESSION\_TIMEOUT

Default session timeout for Apache Tomcat

Default: `30`

## Upgrade

To upgrade to a more recent version of Bitbucket Server you can simply stop the Bitbucket
container and start a new one based on a more recent image:

    docker stop bitbucket
    docker rm bitbucket
    docker run ... (see above)

As your data is stored in the data volume directory on the host, it will still
be available after the upgrade.

Note: Please make sure that you don't accidentally remove the bitbucket container and its volumes using the -v option.

## Backup

For evaluations you can use the built-in database that will store its files in the Bitbucket Server home directory. In that case it is sufficient to create a backup archive of the directory on the host that is used as a volume (`/var/atlassian/application-data/bitbucket` in the example above).

## Versioning

### `alvistack/bitbucket:latest`

The `latest` tag matches the most recent [GitHub Release](https://github.com/alvistack/docker-bitbucket/releases) of this repository. Thus using `alvistack/bitbucket:latest` or `alvistack/bitbucket` will ensure you are running the most up to date stable version of this image.

### `alvistack/bitbucket:<version>`

The version tags are rolling release rebuild by [Travis](https://travis-ci.com/alvistack/docker-bitbucket) in weekly basis. Thus using these tags will ensure you are running the latest packages provided by the base image project.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
