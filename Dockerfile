FROM openjdk:8-jre-alpine

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JHIPSTER_SLEEP=0 \
    JAVA_OPTS=""

RUN wget https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/1.9.0/elastic-apm-agent-1.9.0.jar -O elastic-apm-agent-1.9.0.jar && chmod +x elastic-apm-agent-1.9.0.jar

CMD echo "The application will start in ${JHIPSTER_SLEEP}s..." && \
    sleep ${JHIPSTER_SLEEP} && \
    java ${JAVA_OPTS} -javaagent:/elastic-apm-agent-1.9.0.jar -Delastic.apm.server_urls=http://10.50.3.148:8200 -Delastic.apm.service_name=ad1-flow-engine -Djava.security.egd=file:/dev/./urandom -jar /app.war --spring.profiles.active=qa

EXPOSE 8215 5701/udp

ADD *.war /app.war