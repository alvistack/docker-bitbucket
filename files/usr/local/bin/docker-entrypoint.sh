#!/bin/bash

set -o xtrace

# Prepend executable if command starts with an option
if [ "${1:0:1}" = '-' ]; then
    set -- /opt/atlassian/bitbucket/bin/start-bitbucket.sh "$@"
fi

# Allow the container to be stated with `--user`
if [ "$1" = '/opt/atlassian/bitbucket/bin/start-bitbucket.sh' ] && [ "$(id -u)" = '0' ]; then
    mkdir -p $BITBUCKET_HOME
    chown -Rf $BITBUCKET_OWNER:$BITBUCKET_GROUP $BITBUCKET_HOME
    chmod 0755 $BITBUCKET_HOME
    exec gosu $BITBUCKET_OWNER "$BASH_SOURCE" "$@"
fi

exec "$@"
