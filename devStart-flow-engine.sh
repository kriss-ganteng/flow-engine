#!/bin/bash

export defaultWar=flow-engine-0.0.1-SNAPSHOT.war
echo Start Server

cd target

echo run $defaultWar
java -Xms100m -Xmx1024m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=3339 -jar $defaultWar --spring.profiles.active=dev
