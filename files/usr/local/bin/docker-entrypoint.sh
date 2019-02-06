#!/bin/bash

set -o xtrace

# Running Bitbucket in foreground
exec /etc/init.d/bitbucket start -fg
