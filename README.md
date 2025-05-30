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

El sistema está diseñado para apoyar la gestión operativa y administrativa de una empresa dedicada al transporte de pasajeros. A través de este sistema, se puede registrar y organizar de manera eficiente la información relacionada con clientes, vehículos, choferes y las reservas de viajes. Además, permite controlar los pagos y calcular montos en función de las tarifas aplicadas, asegurando un seguimiento completo de los servicios prestados.

La base de datos incluye un módulo para gestionar la información de los pasajeros que hacen uso del servicio. Cada pasajero es identificado de forma única mediante su RUT, y se almacenan sus datos personales como el nombre, apellido, correo electrónico y teléfono de contacto. Esta información permite a la empresa comunicarse con los clientes cuando sea necesario y mantener un historial de sus reservas previas.

El sistema también administra la flota de vehículos disponibles para operar. Cada vehículo cuenta con un identificador único y se registran características clave como la patente, el modelo, la clase del vehículo (por ejemplo, van, minibús o bus), su tarifa base y la capacidad de pasajeros que puede transportar. Esta información es crucial para asignar el vehículo adecuado según el tipo de servicio solicitado y la cantidad de pasajeros.

Para garantizar un servicio seguro y confiable, se mantiene un registro actualizado de todos los choferes disponibles. Cada conductor está vinculado a un identificador único y se almacena su RUT, nombre completo, número de contacto y el tipo o número de licencia profesional que posee. Este registro permite asignar choferes a reservas específicas según disponibilidad, tipo de servicio o tipo de vehículo requerido.

El corazón del sistema lo constituye la tabla de reservas, que actúa como el eje que conecta a pasajeros, vehículos y choferes. Cada vez que un cliente contrata un servicio de transporte, se genera una nueva reserva con un identificador único. En este registro se vincula el pasajero que realiza la solicitud (mediante su RUT), el vehículo asignado, el chofer responsable, y se detallan aspectos específicos del viaje, como la cantidad de pasajeros, el estado de la reserva (pendiente, confirmada, completada o cancelada), el tipo de servicio contratado (por ejemplo, traslado al aeropuerto, viaje urbano, viaje interurbano), así como la fecha, hora, lugar de origen y destino del viaje.

También se registran los aspectos financieros de la reserva, como el monto total a pagar por el servicio y el método de pago utilizado (ya sea efectivo, transferencia, tarjeta de débito o crédito, etc.).

Esta tabla no solo permite controlar todas las reservas, sino que también sirve para generar informes, hacer seguimiento del historial de cada cliente, medir la eficiencia de los choferes y del uso de la flota, y proyectar necesidades operativas futuras.

El sistema establece relaciones claras entre las diferentes entidades:

    -Un mismo pasajero puede realizar múltiples reservas a lo largo del tiempo.

    -Cada reserva está asociada a un único chofer y un único vehículo, aunque un mismo chofer o vehículo puede participar en múltiples reservas distintas.

    -Las reservas se cruzan con información de tipo servicio, método de pago y estado, lo que permite filtrar y analizar la operación desde múltiples perspectivas.

