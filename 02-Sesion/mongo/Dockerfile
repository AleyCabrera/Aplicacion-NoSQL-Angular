# Utiliza la imagen oficial de Ubuntu como base
FROM ubuntu:20.04

# Establecer variables de entorno para evitar preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias, incluyendo wget y gnupg
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -qO - https://pgp.mongodb.com/server-4.4.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    apt-get update && \
    apt-get install -y mongodb-org

# Crear un volumen para los datos de MongoDB
VOLUME /data/db

# Definir las variables de entorno para el usuario root de MongoDB
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=abcd1234

# Exponer el puerto de MongoDB
EXPOSE 27017

# Comando de inicio para MongoDB
CMD ["mongod", "--bind_ip_all"]