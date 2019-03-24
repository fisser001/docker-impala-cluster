#!/bin/bash

sleep 45
#/etc/init.d/impala-state-store start
source /etc/default/impala
/usr/bin/statestored ${IMPALA_STATE_STORE_ARGS}
