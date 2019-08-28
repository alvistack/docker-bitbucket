#!/bin/bash

set -o xtrace

# Prepend executable if command starts with an option
if [ "${1:0:1}" = '-' ]; then
    set -- /opt/atlassian/bitbucket/bin/start-bitbucket.sh "$@"
fi

# Ensure required folders exist with correct owner:group
mkdir -p $BITBUCKET_HOME
chown -Rf $BITBUCKET_OWNER:$BITBUCKET_GROUP $BITBUCKET_HOME
chmod 0755 $BITBUCKET_HOME

exec "$@"
