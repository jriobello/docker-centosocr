# docker-centosocr
Simple Dockerfile with tomcat to test openshift.

Montado en cluster, verifica que no hay perdida de sesión cuando se tira el pod en el que converges.

Es necesario crear la variable de entorno:
DNS_MEMBERSHIP_SERVICE_NAME=my-tomcat-app-membership

my-tomcat-app-membership es un servicio en os, ver my-tomcat-app-membership.yaml
