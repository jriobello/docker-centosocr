# docker-centosocr
Simple Dockerfile with tomcat to test openshift.

Montado en cluster, verifica que no hay perdida de sesión cuando se tira el pod en el que converges.

Es necesario crear la variable de entorno:
DNS_MEMBERSHIP_SERVICE_NAME=my-tomcat-app-membership
en los pods que levantes tomcat.

Es necesario crear antes de levantar esos tomcat el servicio para que tribes sepa los nodos vivos...
my-tomcat-app-membership es un servicio en os, ver dns-membership-service.yml

Luego, he modificado el server.xml para que tomcat trabaje en cluster, y el web.xml para que se replique la sesión.

Lecturas:
https://tomcat.apache.org/tomcat-9.0-doc/api/org/apache/catalina/tribes/membership/cloud/DNSMembershipProvider.html
https://stackoverflow.com/questions/37077042/marking-application-without-web-xml-distributable-for-tomcat-session-replication
