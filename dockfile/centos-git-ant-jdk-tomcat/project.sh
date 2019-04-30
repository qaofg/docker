#! /bin/sh

mkdir /project
cd /project
git clone https://git.coding.net/bj_tootoo/webapp.git
ls -l
cd webapp
ant -f webapp.xml
ls -l

#删除tomcat自带项目
rm -rf /usr/local/tomcat7/webapps/*
mkdir /usr/local/tomcat7/webapps/ROOT
cp -r target/webapp/* /usr/local/tomcat7/webapps/ROOT
cd /usr/local/tomcat7/bin
./catalina.sh start
tail -f ../logs/catalina.out
#tail -f /dev/null
