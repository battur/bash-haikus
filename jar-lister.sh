#!/bin/bash
##########################################################################
# You needed to make sure you have the same versions of jar files across
# the products/projects line. How would you list those files so that you
# complete an audit so easily?
# 
# Would sorted listing by columns of (jar, md5, size, location) help?
#
# Author: Battur Sanchin (battursanchin@gmail.com)
# January, 2015
#
# License: Apache 2.0
# 
##########################################################################

# let's prepare some temp file
tmp=/tmp/tmp-$$

# prepare table header
echo "Jar MD5 Size Location"  > $tmp-result
echo "--- --- ---- --------" >> $tmp-result

# list jar files
find . -type f -iname "*.jar" |\
while read f; 
do
  echo "$(basename $f) $(md5sum $f | awk '{print $1}') $(ls -l $f | awk '{print $5}') $f"
done                          |\
sort                          >> $tmp-result

# let's print the result to sdtout in a nice format
column -t $tmp-result 

# remove temp files
rm $tmp-* 2> /dev/null

exit 0
