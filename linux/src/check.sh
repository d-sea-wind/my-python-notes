#!/bin/bash

chksum1=`md5sum $1 | awk '{print $1}'`
chksum2=`md5sum $2 | awk '{print $1}'`

if [ $chksum1 = $chksum2 ]
then
    echo '两个文件一致'
else
    echo '两个文件又差异'
fi
