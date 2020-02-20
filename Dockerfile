FROM alpine:3.9

RUN wget http://us.mirrors.quenda.co/apache/tomcat/tomcat-9/v9.0.31/bin/apache-tomcat-9.0.31.tar.gz

RUN apk add openjdk8-jre

RUN mkdir -p /opt/apache-tomcat
RUN tar -xvzf apache-tomcat-9.0.31.tar.gz -C /opt/apache-tomcat --strip-components 1

RUN wget https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war -O /opt/apache-tomcat/webapps/sample.war

EXPOSE 8080

ENTRYPOINT ["/opt/apache-tomcat/bin/catalina.sh", "run"]
