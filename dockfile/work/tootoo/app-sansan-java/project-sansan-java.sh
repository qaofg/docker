#! /bin/sh

project_name=sansan

mkdir /project
cd /project
git clone git@.../${project_name}.git
ls -l
cd ${project_name}
ant -f ${project_name}.xml
ls -l

#删除tomcat自带项目
rm -rf /usr/local/tomcat7/webapps/*
mkdir /usr/local/tomcat7/webapps/ROOT
cp -r target/webapp/* /usr/local/tomcat7/webapps/ROOT
cd /usr/local/tomcat7/bin
./catalina.sh start
tail -f ../logs/catalina.out
#tail -f /dev/null
