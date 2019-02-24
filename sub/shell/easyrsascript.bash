#!/bin/bash
./easyrsa --subject-alt-name="IP:${MASTER_ID},"\
"IP:${MASTER_ID},"\
"DNS:kubernetes,"\
"DNS:kubernetes.default,"\
"DNS:kubernetes.default.svc,"\
"DNS:kubernetes.default.svc.cluster,"\
"DNS:kubernetes.default.svc.cluster.local," \
--days=10000 \
build-server-full server nopass

# You may need to locate the easyrsa
# /Users/bssg/Documents/var/src/easy-rsa/easyrsa3/easyrsa

