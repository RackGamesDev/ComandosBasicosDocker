#Esto es un Dockerfile de ejemplo, se tiene que llamar exactamente asi y especifica los datos para crear una imagen, cualquiera de los siguientes comandos se puede poner varias veces

#De que imagen va a derivar
FROM node:latest

#Establecer el directorio donde se ejecutaran los siguientes comandos
WORKDIR /

#Especificar un usuario para ejecutar comandos
USER root

#Comando inicial cuando se cree la imagen, normalmente sera para preparar todo
RUN mkdir -p /home/app
RUN mkdir /externo
RUN echo carpeta \
creada
#Se puede especificar que se ejecute una vez hecho el build del imagen
ONBUILD RUN apt update

#Copiando archivos del host al contenedor (de ./app a /home/app)
COPY ./contenido /home/app
#Este script se ejecutara automaticamente cuando se inicie el contenedor
COPY ./docker-entrypoint.sh /docker-entrypoint.d

#Similar a COPY, con ADD se pueden usar urls a archivos
#ADD https://example.com/file.tar. /home/app

#Declarando "variables" para usar en este Dockerfile
ARG CARPETAOBLIGATORIA=hola
#Usando esas variables
RUN mkdir /${CARPETAOBLIGATORIA}

#Estableciendo variables de entorno para la imagen
ENV PASSWORD=123456789

#Abre una carpeta para que al ejecutar el Dockerfile se cree un volumen en esta
VOLUME ["/externo"]

#Exponiendo un puerto del contenedor para otros contenedores o para el host (para otros contenedores se toma como nombre de host el nombre del contenedor)
EXPOSE 3000
EXPOSE 4000

WORKDIR /home/app

#Comando que se ejecuta cada vez que se inicie el contenedor, normalmente ejecutara el programa que tenga instalado
CMD ["echo", "comando inicial"]
#Concretamente el que abre el programa deberia ser este
ENTRYPOINT ["/docker-entrypoint.d/docker-entrypoint.sh"]

#Estableciendo etiquetas a la imagen que apareceran en su info
LABEL creador="unusuario"

