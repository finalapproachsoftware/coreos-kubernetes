#!/bin/sh

PATH=/usr/bin:/usr/local/bin

set -e

CLUSTER_IP="10.2.2.10"
NODE_IP="172.17.4.99"

mkdir -p ssl && ./../lib/init-ssl-ca ssl || echo "failed generating SSL CA artifacts"
./../lib/init-ssl ssl apiserver controller IP.1=$NODE_IP,IP.2=$CLUSTER_IP || echo "failed generating SSL certificate artifacts"
./../lib/init-ssl ssl admin kube-admin || echo "failed generating admin SSL artifacts"