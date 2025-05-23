# Docker Image Packaging for Atlassian Bitbucket

<a href="https://alvistack.com" title="AlviStack" target="_blank"><img src="/alvistack.svg" height="75" alt="AlviStack"></a>

[![GitLab pipeline
status](https://img.shields.io/gitlab/pipeline/alvistack/docker-bitbucket/master)](https://gitlab.com/alvistack/docker-bitbucket/-/pipelines)
[![GitHub
tag](https://img.shields.io/github/tag/alvistack/docker-bitbucket.svg)](https://github.com/alvistack/docker-bitbucket/tags)
[![GitHub
license](https://img.shields.io/github/license/alvistack/docker-bitbucket.svg)](https://github.com/alvistack/docker-bitbucket/blob/master/LICENSE)
[![Docker
Pulls](https://img.shields.io/docker/pulls/alvistack/bitbucket-9.6.svg)](https://hub.docker.com/r/alvistack/bitbucket-9.6)

Bitbucket is an on-premises source code management solution for Git
that's secure, fast, and enterprise grade. Create and manage
repositories, set up fine-grained permissions, and collaborate on code -
all with the flexibility of your servers.

Learn more about Bitbucket:
<https://www.atlassian.com/software/bitbucket>

## Supported Tags and Respective Packer Template Links

- [`alvistack/bitbucket-9.6`](https://hub.docker.com/r/alvistack/bitbucket-9.6)
  - [`packer/docker-9.6/packer.json`](https://github.com/alvistack/docker-bitbucket/blob/master/packer/docker-9.6/packer.json)
- [`alvistack/bitbucket-9.4`](https://hub.docker.com/r/alvistack/bitbucket-9.4)
  - [`packer/docker-9.4/packer.json`](https://github.com/alvistack/docker-bitbucket/blob/master/packer/docker-9.4/packer.json)
- [`alvistack/bitbucket-8.19`](https://hub.docker.com/r/alvistack/bitbucket-8.19)
  - [`packer/docker-8.19/packer.json`](https://github.com/alvistack/docker-bitbucket/blob/master/packer/docker-8.19/packer.json)

## Overview

This Docker container makes it easy to get an instance of Bitbucket up
and running.

Based on [Official Ubuntu Docker
Image](https://hub.docker.com/_/ubuntu/) with some minor hack:

- Packaging by Packer Docker builder and Ansible provisioner in single
  layer
- Handle `ENTRYPOINT` with
  [catatonit](https://github.com/openSUSE/catatonit)

### Quick Start

For the `Bitbucket_HOME` directory that is used to store the repository
data (amongst other things) we recommend mounting a host directory as a
[data
volume](https://docs.docker.com/engine/tutorials/dockervolumes/#/data-volumes),
or via a named volume if using a docker version \>= 1.9.

Volume permission is NOT managed by entry scripts. To get started you
can use a data volume, or named volumes.

Start Atlassian Bitbucket Server:

    # Pull latest image
    docker pull alvistack/bitbucket-9.6

    # Run as detach
    docker run \
        -itd \
        --name bitbucket \
        --publish 7990:7990 \
        --publish 7999:7999 \
        --volume /var/atlassian/application-data/bitbucket:/var/atlassian/application-data/bitbucket \
        alvistack/bitbucket-9.6

**Success**. Bitbucket is now available on <http://localhost:7990>

Please ensure your container has the necessary resources allocated to
it. We recommend 2GiB of memory allocated to accommodate both the
application server and the git processes. See [Supported
Platforms](https://confluence.atlassian.com/display/Bitbucket/Supported+Platforms)
for further information.

## Upgrade

To upgrade to a more recent version of Bitbucket Server you can simply
stop the Bitbucket container and start a new one based on a more recent
image:

    docker stop bitbucket
    docker rm bitbucket
    docker run ... (see above)

As your data is stored in the data volume directory on the host, it will
still be available after the upgrade.

Note: Please make sure that you don't accidentally remove the bitbucket
container and its volumes using the -v option.

## Backup

For evaluations you can use the built-in database that will store its
files in the Bitbucket Server home directory. In that case it is
sufficient to create a backup archive of the directory on the host that
is used as a volume (`/var/atlassian/application-data/bitbucket` in the
example above).

## Versioning

### `YYYYMMDD.Y.Z`

Release tags could be find from [GitHub
Release](https://github.com/alvistack/docker-bitbucket/tags) of this
repository. Thus using these tags will ensure you are running the most
up to date stable version of this image.

### `YYYYMMDD.0.0`

Version tags ended with `.0.0` are rolling release rebuild by [GitLab
pipeline](https://gitlab.com/alvistack/docker-bitbucket/-/pipelines) in
weekly basis. Thus using these tags will ensure you are running the
latest packages provided by the base image project.

## License

- Code released under [Apache License 2.0](LICENSE)
- Docs released under [CC BY
  4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

- Wong Hoi Sing Edison
  - <https://twitter.com/hswong3i>
  - <https://github.com/hswong3i>
