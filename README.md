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
-Pasajeros: almacena información de los clientes que utilian el servicio, incluye el rut, nombre, apellido, correo y telefono de contacto
-Vehiculos: registran los móviles disponibles en la flota, incluye un id unico para cada vehiculo, patente, modelo, clase, tarifa base y la capacidad de cada vehiculo
-Choferes: almacena información sobre los conductores, incluye un id unico para cada chofer, el rut, nombre, apellido, contacto y licencia 
-Hechos_Reservas: es un registro de los servicios contratados por los pasajeros que relaciona todas las demás tablas, almacena una id unica para la reserva, el rut del pasajero, id del chofer asociado, la id del vehiculo asociado, la cantidad de pasajeros que realizarán el viaje, estado de la reserva, el tipo de servicio, fecha, hora, origen, el destino, el monto total del pago y el metodo de pago

```
