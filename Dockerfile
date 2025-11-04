# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0
FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Instalar Python 3 y pip
RUN yum update -y && \
    yum install -y python3 python3-pip && \
    yum clean all

# Copiar archivos de la aplicación
COPY . /app
WORKDIR /app

# Instalar dependencias de Python
RUN pip3 install -r requirements.txt

# Exponer puerto
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python3", "app.py"]