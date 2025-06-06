Base de datos Transfer Los Rios grupo 7

Integrantes: 
-Nicolás Córdova
-Sebastián Cuevas
-Angelo Ortiz

## Especificación de la base de datos:

El sistema está diseñado para apoyar la gestión operativa y administrativa de una empresa dedicada al transporte de pasajeros. A través de este sistema, se puede registrar y organizar de manera eficiente la información relacionada con clientes, vehículos, choferes y las reservas de cada viaje. Además, permite controlar los pagos y calcular montos en función de las tarifas aplicadas, asegurando un seguimiento completo de los servicios prestados.

La base de datos incluye un módulo para gestionar la información de los pasajeros que hacen uso del servicio. Cada pasajero es identificado de forma única mediante su RUT, y se almacenan sus datos personales como el nombre, apellido, correo electrónico y teléfono de contacto.

El sistema también administra la flota de vehículos disponibles para operar. Cada vehículo cuenta con un identificador único y se registran características clave como la patente, el modelo, la clase del vehículo (por ejemplo van, auto particular, etc), su tarifa base y la capacidad de pasajeros que puede transportar.

Para garantizar un servicio seguro y confiable, se mantiene un registro actualizado de todos los choferes disponibles. Cada conductor está vinculado a un identificador único y se almacena su RUT, nombre y apellido, número de contacto y el tipo de licencia profesional que posee. Este registro permite asignar choferes a reservas específicas según disponibilidad, tipo de servicio o tipo de vehículo requerido.

El corazón del sistema lo constituye la tabla de reservas, que actúa como el eje que conecta a pasajeros, vehículos y choferes. Cada vez que un cliente contrata un servicio de transporte, se genera una nueva reserva con un identificador único. En este registro se vincula el pasajero que realiza la solicitud (mediante su RUT), el vehículo asignado, el chofer responsable, y se detallan aspectos específicos del viaje, como la cantidad de pasajeros, el estado de la reserva (pendiente, confirmada, completada o cancelada), el tipo de servicio contratado (por ejemplo, traslado al aeropuerto, viaje urbano, viaje interurbano), así como la fecha, hora, lugar de origen y destino del viaje. También se registran los aspectos financieros de la reserva, como el monto total a pagar por el servicio y el método de pago utilizado (ya sea efectivo, transferencia, tarjeta de débito o crédito, etc.).

Se establecen las siguientes relaciones en el sistema:

    -Un mismo pasajero puede realizar múltiples reservas a lo largo del tiempo.

    -Cada reserva está asociada a un único chofer y un único vehículo, aunque un mismo chofer o vehículo puede participar en múltiples reservas distintas.

    -Las reservas se cruzan con información de tipo servicio, método de pago y estado, lo que permite filtrar y analizar la operación desde múltiples perspectivas.


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



