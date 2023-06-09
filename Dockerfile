FROM alpine:3.17
LABEL AUTHOR="chandini"
#RUN apk add open jdk17-jre
RUN apk add --no-cache openjdk17-jre
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz .
RUN tar xf apache-tomcat-9.0.73.tar.gz
RUN rm -rf apache-tomcat-9.0.73.tar.gz
RUN mv apache-tomcat-9.0.73 tomcat9
COPY target/hr-api*.war /opt/tomcat9/webapps/hr-api.war 
EXPOSE 8080 
CMD ["/opt/tomcat9/bin/catalina.sh","run"]
