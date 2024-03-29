FROM alpine:latest
LABEL Author="Jorge Riobello"

USER root
RUN apk update && apk upgrade
RUN apk fetch openjdk8
RUN apk add openjdk8

## Descargar tomcat 9
#RUN cd /tmp && wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz
RUN cd /tmp && wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz

## Descomprimir tomcat
RUN tar -zxvf /tmp/apache-tomcat-9.0.55.tar.gz -C /usr/local

## Renombrar la carpeta descomprimida a "tomcat"
RUN cd /usr/local && mv apache-tomcat-9.0.55 tomcat

## Eliminar instaladores descargados
RUN cd /tmp && rm -f apache-tomcat-9.0.55.tar.gz

#Crear usuario tomcat y dar permisos
RUN addgroup -S tomcat && adduser -S tomcat -G tomcat
RUN cd /usr/local/tomcat && chown -R tomcat:tomcat . && chmod -R 777 .

#Configuramos cluster con servicio DNS de cloud...
#RUN cd /usr/local/tomcat/conf && mv server.xml server.xml.original
#RUN cd /usr/local/tomcat/conf && wget https://raw.githubusercontent.com/jriobello/docker-centosocr/master/server.xml

#Configuracion especifica
#RUN cd /usr/local/tomcat/webapps/examples/WEB-INF && mv web.xml web.xml.original
#RUN cd /usr/local/tomcat/webapps/examples/WEB-INF && wget https://raw.githubusercontent.com/jriobello/docker-centosocr/master/web.xml

#Descargamos war
RUN cd /usr/local/tomcat/webapps && wget https://github.com/jlumietu/open-shift-tomcat-app/releases/download/1.0.0-RC1/smvcwk.war


## Exponer puerto
EXPOSE 8080

## Iniciar tomcat
#CMD sh /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out
#CMD [ "su", "-s", "/bin/sh", "-c", "/usr/local/tomcat/bin/catalina.sh start", "tomcat" ]
CMD /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out


