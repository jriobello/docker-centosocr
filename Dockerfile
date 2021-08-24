FROM centos

MAINTAINER j-riobello@ejie.eus

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.52/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
