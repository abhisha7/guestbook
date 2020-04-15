FROM suranagivinod/openjdk8
WORKDIR /tmp


USER root

RUN chown -R root:root /tmp/ && chmod -R u=rx,g=,o= /tmp/
#WORKDIR /var/jenkins_home/workspace/maven-job-spring/target/
#ARG jenkins_jar_file=/root/guestbook-1.2.0-SNAPSHOT.jar
#ENV jenkins_jar_file ${jenkins_jar_file}
ADD ./target/guestbook-1.2.0-SNAPSHOT.jar /tmp/spring-app.jar
#COPY *.jar /tmp/sping-app.jar
RUN chmod +x /tmp/spring-app.jar

ENTRYPOINT ["java", "-jar", "./tmp/spring-app.jar"]

#USER jenkins
