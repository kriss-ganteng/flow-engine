@echo off
echo Compile with skip test
mvn clean install -Dmaven.test.skip=true