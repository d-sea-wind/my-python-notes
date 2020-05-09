#!/bin/bash

today=`date +%Y-%m-%d`
filename="Backup-$today.tgz"
tar -vczf $filename $@
