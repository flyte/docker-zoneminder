#!/bin/sh

set -ex

confp confp.yml

. /etc/apache2/envvars
apache2

exec /usr/bin/zmpkg.pl
