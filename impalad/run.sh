#!/bin/bash

sleep 65
#/etc/init.d/impala-server start
source /etc/default/impala
/usr/bin/impalad ${IMPALA_SERVER_ARGS}
