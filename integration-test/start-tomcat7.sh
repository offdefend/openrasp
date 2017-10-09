#!/bin/bash

set +e

wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.81/bin/apache-tomcat-7.0.81.tar.gz

tar zxf apache-tomcat-7.0.81.tar.gz

HOME=$(pwd)/apache-tomcat-7.0.81

cp app.war ${HOME}/webapps/

cp -R rasp ${HOME}/

chmod 777 ${HOME}/rasp

export JAVA_OPTS="-javaagent:${HOME}/rasp/rasp.jar -Dlog4j.rasp.configuration=file://${HOME}/rasp/conf/rasp-log4j.xml ${JAVA_OPTS}"

sh ${HOME}/bin/startup.sh