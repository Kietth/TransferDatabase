Base de datos Transfer Los Rios grupo 7

Integrantes: 
-Nicolás Córdova
-Sebastián Cuevas
-Angelo Ortiz

## Diagrama Base de Datos
![ImageAlt](https://github.com/Kietth/TransferDatabase/blob/c57798244657da7ac1ad27d55cd079827b01fe4d/diagrama.png)

## Como usar el programa:
```
1. Instalar dependencias:
    pip install psycopg2
    pip install matplotlib
    pip install pandas

2. Dentro del programa analisis.py, modificar los parámetros de conexión a la base de datos

3. Ejecutar el programa como: python analisis.py año    o    python3 analisis.py año
```


## Especificación de la base de datos:

Sistema que permite gestionar las operaciones de una empresa de transporte de pasajeros, incluyendo reservas, vehiculos, choferes, pagos y tarifas.
```
-Pasajeros: almacena información de los clientes que utilian el servicio 
-Vehiculos: registran los móviles disponibles en la flota 
-Tipos_Vehiculos: define la categoría de los vehículos y sus características
-Choferes: almacena información sobre los conductores
-Hechos_Reservas: es un registro de los servicios contratados por los pasajeros que relaciona todas las demás tablas
-Pagos: registra los pagos asociados a cada reserva.
```
