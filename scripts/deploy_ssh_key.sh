#!/bin/bash

for port in 2221 2222 2223; do
  ssh-copy-id -i ~/.ssh/ansible_lab.pub \
    -o StrictHostKeyChecking=no \
    -p $port root@127.0.0.1
done