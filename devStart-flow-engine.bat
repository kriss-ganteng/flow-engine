@echo off

set defaultWar=flow-engine-0.0.1-SNAPSHOT.war
set warFile=%1

echo Start Server

cd target

IF [%1]==[] (
	echo run %defaultWar%
	java -Xms100m -Xmx1024m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=3339 -jar %defaultWar% --spring.profiles.active=dev
) ELSE (
	echo run %warFile%
	java -Xms100m -Xmx1024m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=3339 -jar %warFile% --spring.profiles.active=dev
)


cd..
