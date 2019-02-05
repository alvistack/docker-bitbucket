#!/bin/bash

set -o xtrace

# Ensure required folders exist with correct owner:group
mkdir -p $BITBUCKET_HOME
chmod 0755 $BITBUCKET_HOME
chown -Rf $BITBUCKET_OWNER:$BITBUCKET_GROUP $BITBUCKET_HOME

# Running Bitbucket in foreground
exec /etc/init.d/bitbucket start -fg
