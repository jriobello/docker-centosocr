FROM alpine:latest
LABEL Author="Jorge Riobelloa"

USER root
RUN apk update && apk upgrade
RUN apk fetch openjdk8
RUN apk add openjdk8

## Descargar tomcat 9
RUN cd /tmp && wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz

## Descomprimir tomcat
RUN tar -zxvf /tmp/apache-tomcat-9.0.52.tar.gz -C /usr/local

## Renombrar la carpeta descomprimida a "tomcat"
RUN cd /usr/local && mv apache-tomcat-9.0.52 tomcat

## Eliminar instaladores descargados
RUN cd /tmp && rm -f apache-tomcat-9.0.52.tar.gz

#Crear usuario tomcat y dar permisos
RUN addgroup -S tomcat && adduser -S tomcat -G tomcat
RUN cd /usr/local/tomcat && chown -R tomcat:tomcat . && chmod -R 777 .

## Exponer puerto
EXPOSE 8080

## Iniciar tomcat
#CMD sh /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out
#CMD [ "su", "-s", "/bin/sh", "-c", "/usr/local/tomcat/bin/catalina.sh start", "tomcat" ]
CMD /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out


