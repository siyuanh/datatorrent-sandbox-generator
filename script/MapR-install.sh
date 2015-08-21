#!/bin/bash

#############  Make changes to MapR sandbox  ##########################
#uninstall unecessary mapr services
rpm -e mapr-oozie mapr-oozie-internal mapr-pig mapr-hue mapr-hiveserver2 mapr-hivemetastore mapr-hive mapr-hbasethrift mapr-hbase

#Change the cpu-vores settting for more available vores
for f in `find /opt/mapr/hadoop/hadoop-2.* -name "yarn-site.xml"`
do
  sed -i '/<\/configuration>/i \
  \<property\> \
    <name>yarn.nodemanager.resource.cpu-vcores<\/name> \
    <value>8<\/value> \
  <\/property>' $f
done

#reduce the preserved heapsize used by file server
sed -i 's/service.command.mfs.heapsize.percent/service.command.mfs.heapsize.percent=15/' /opt/mapr/conf/warden.conf

#install nodejs dependencies for demo ui
curl -sL https://rpm.nodesource.com/setup | bash
yum install -y nodejs dos2unix
npm install forever -g
