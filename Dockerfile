FROM alpine:latest
LABEL Author="Jorge Riobelloa"
USER root

RUN apk update && apk upgrade

RUN apk fetch openjdk8
RUN apk add openjdk8

## Descargar tomcat 8
RUN cd /tmp && wget https://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.41/bin/apache-tomcat-8.5.41.tar.gz

## Descomprimir tomcat
RUN tar -zxvf /tmp/apache-tomcat-8.5.41.tar.gz -C /usr/local

## Renombrar la carpeta descomprimida a "tomcat"
RUN cd /usr/local && mv apache-tomcat-8.5.41 tomcat

## Eliminar instaladores descargados
RUN cd /tmp && rm

## Exponer puerto
EXPOSE 8080

## Iniciar tomcat
CMD sh /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out
