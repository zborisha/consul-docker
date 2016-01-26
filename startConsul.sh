#!/bin/bash

if [[ -z $ADVERTISE ]]; then export ADVERTISE="127.0.0.1"; fi

/opt/consul/consul agent -ui -ui-dir=/opt/consul/ui/ -data-dir=/opt/consul/data/ -dev -client=0.0.0.0 -advertise=$ADVERTISE
