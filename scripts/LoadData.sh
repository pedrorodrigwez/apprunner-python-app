#!/bin/bash

# Script para cargar datos de prueba en DynamoDB
echo "Cargando datos de prueba en la tabla Movies de DynamoDB..."

# Verificar que existe el archivo de datos
if [ ! -f "moviedata.json" ]; then
    echo "Error: No se encuentra el archivo moviedata.json"
    exit 1
fi

# Ejecutar el script de Python para cargar los datos (desde el directorio raíz)
python3 scripts/MoviesLoadData.py

if [ $? -eq 0 ]; then
    echo "✅ Datos cargados exitosamente en DynamoDB"
else
    echo "❌ Error al cargar los datos"
    exit 1
fi