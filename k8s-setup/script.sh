#!/bin/bash
cat /tmp/join-master-command-inicial.sh  | cut -c4973-5258 | tr -d "\\\\" | tr -d "," | tr -d "\"" > /tmp/join-master-command-final.sh

