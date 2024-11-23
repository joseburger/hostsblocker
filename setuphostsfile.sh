#!/bin/bash
if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi
# remove old hosts file
rm /etc/hosts

# Now download the new hosts file and put it into place
curl -H 'Cache-Control: no-cache, no-store' "http://sbc.io/hosts/alternates/fakenews-gambling-porn/hosts" >> /etc/hosts
# add my own custom entries to host file
cat customhosts >> /etc/hosts

# create/update full hosts file for use on android via custom dns etc.
curl -H 'Cache-Control: no-cache, no-store' "http://sbc.io/hosts/alternates/fakenews-gambling-porn/hosts" >> fullhostslist
# add my own custom entries to host file
cat customhosts >> fullhostslist

echo "done"

exit 0
