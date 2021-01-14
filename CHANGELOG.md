# Docker Image Packaging for Atlassian Bitbucket

## YYYYMMDD.Y.Z - TBC

### Major Changes

## 20210114.1.0 - 2021-01-14

### Major Changes

  - Change GIT tag as per Vagrant Box naming and versioning limitation

## 7.8.0-4alvistack2 - 2020-12-09

### Major Changes

  - Migrate from Travis CI to GitLab CI
  - Revamp with Packer

## 7.6.0-4alvistack5 - 2020-10-14

### Major Changes

  - Upgrade minimal AdoptOpenJDK support to 11
  - Migrate GC from `G1GC` to `ZGC`
  - Refine Molecule matrix

## 7.5.1-4alvistack2 - 2020-08-26

### Major Changes

  - Upgrade minimal Ansible Lint support to 4.3.2
  - Upgrade Travis CI test as Ubuntu Focal based
  - Upgrade minimal Ansible support to 2.10.0

## 7.3.0-4alvistack5 - 2020-06-10

### Major Changes

  - Revamp `create`, `side_effect`, `verify` and `destroy` logic
  - Replace `tini` with `catatonit`
  - Rename `post_tasks.yml` as `side_effect.yml`
  - Upgrade base image to Ubuntu 20.04

## 7.1.1-4alvistack2 - 2020-04-11

### Major Changes

  - Provision with systemd support

## 6.10.1-4alvistack4 - 2020-03-05

### Major Changes

  - Revamp with Molecule and `docker commit`
  - Consolidate molecule tests into `default` (noop)
  - Hotfix for systemd

## 6.10.0-3alvistack1 - 2020-01-15

### Major Changes

  - Replace `dumb-init` with `tini`, as like as `docker --init`
  - Replace `java` with `openjdk`
  - Include release specific vars and tasks

## 6.7.2-2alvistack3 - 2019-11-05

### Major Changes

  - Upgrade minimal Ansible support to 2.9.0
  - Upgrade Travis CI test as Ubuntu Bionic based
  - Default with Python 3
  - Hotfix for en\_US.utf8 locale
  - Allow the container to be stated with `--user`
  - Simplify parameters combination with `BITBUCKET_VERSION`
  - Prepend executable if command starts with an option
  - Improve `ENTRYPOINT` and `CMD`

## 6.3.0-0alvistack4 - 2019-05-20

### Major Changes

  - Bugfix "Build times out because no output was received"
  - Upgrade minimal Ansible support to 2.8.0

## 5.16.1-0alvistack5 - 2019-04-16

### Major Changes

  - Run systemd service with specific system user
  - Explicitly set system user UID/GID
  - Manually install archived GIT 2.20.1 for Bitbucket 6.0+, see <https://jira.atlassian.com/browse/BSERV-11593>
  - Porting to Molecule based

## 5.16.0-1alvistack1 - 2018-12-10

### Major Changes

  - Update base image to Ubuntu 18.04
  - Revamp deployment with Ansible roles
  - Replace Oracle Java with OpenJDK

## 5.15.0-0alvistack2 - 2018-10-29

### Major Changes

  - Handle changes with patch
  - Update dumb-init to v.1.2.2
  - Upgrade MySQL Connector/J and PostgreSQL JDBC support
  - Add TZ support
  - Add SESSION\_TIMEOUT support

## 5.8.1-0alvistack4 - 2018-03-11

### Major Changes

  - Simplify Docker image naming

## 5.8.1-0alvistack1 - 2018-02-28

  - Migrate from <https://github.com/alvistack/ansible-container-bitbucket>
  - Pure Dockerfile implementation
  - Ready for both Docker and Kubernetes use cases
