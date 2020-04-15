FROM suranagivinod/openjdk8

#USER root
#WORKDIR /var/jenkins_home/workspace/maven-job-spring/target/
#ARG jenkins_jar_file=/root/guestbook-1.2.0-SNAPSHOT.jar
#ENV jenkins_jar_file ${jenkins_jar_file}
ADD ./target/guestbook-1.2.0-SNAPSHOT.jar /spring-app.jar
#COPY *.jar /tmp/sping-app.jar

ENTRYPOINT ["java", "-jar", "/sping-app.jar"]

#USER jenkins
