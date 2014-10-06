#!/bin/bash
# Docker entrypoint for default config values
ADMIN_USER=${ADMIN_USER:-admin}
ADMIN_PASS=${ADMIN_PASS:-jboss}
pushd /opt/jboss > /dev/null
echo "creating admin user $ADMIN_USER"
./bin/add-user.sh $ADMIN_USER $ADMIN_PASS
./bin/standalone.sh -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0 $*
