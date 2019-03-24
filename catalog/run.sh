#!/bin/bash

sleep 60
#/etc/init.d/impala-catalog start
source /etc/default/impala
/usr/bin/catalogd ${IMPALA_CATALOG_ARGS}
