#!/bin/bash
export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/centos/.local/bin:/home/centos/bin
for i in *.cbl; do
  outf=`echo $i | awk -F. '{print $1}'`
# echo "(cobc -x $i -o /home/centos/suneelcobolmasterbranch/$outf"
  x=$(cobc -x $i -o /home/centos/suneelcobolmasterbranch/$outf);
done
