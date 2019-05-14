# Docker Image Packaging for Atlassian Bitbucket

## 6.3.x-0alvistack1 - TBC

### Major Changes

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
