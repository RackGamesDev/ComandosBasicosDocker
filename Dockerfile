#Esto es un Dockerfile de ejemplo, se tiene que llamar exactamente asi y especifica los datos para crear una imagen, cualquiera de los siguientes comandos se puede poner varias veces

#De que contenedor va a derivar
FROM node:latest

#Establecer el directorio donde se ejecutaran los siguientes comandos
WORKDIR /

#Comando inicial cuando se cree el contenedor, normalmente sera para preparar todo
RUN mkdir -p /home/app
RUN echo carpeta creada

#Copiando archivos del host al contenedor (de ./app a /home/app)
COPY ./contenido /home/app

#Exponiendo un puerto del contenedor para otros contenedores o para el host (para otros contenedores se toma como nombre de host el nombre del contenedor)
EXPOSE 3000
EXPOSE 4000

WORKDIR /home/app

#Comando que se ejecuta cada vez que se inicie el contenedor, normalmente ejecutara el programa que tenga instalado
CMD ["echo", "comando inicial"]
CMD ["echo", "otro comando"]
