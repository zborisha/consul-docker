#!/bin/bash


/opt/consul/consul agent -ui -ui-dir=/opt/consul/ui/ -data-dir=/opt/consul/data/ -dev -client=0.0.0.0
