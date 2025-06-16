CREATE TABLE metodos_pago (
  id_metodo_pago SERIAL PRIMARY KEY,
  nombre varchar NOT NULL
);

CREATE TABLE tipos_servicio (
  id_tipo_servicio SERIAL PRIMARY KEY,
  nombre varchar NOT NULL,
  descripcion varchar
);

CREATE TABLE tipos_vehiculo (
  id_tipo_vehiculo SERIAL PRIMARY KEY,
  clase varchar NOT NULL,
  capacidad int
);

CREATE TABLE pasajeros (
  rut_pasajero int PRIMARY KEY,
  nombre varchar,
  apellido varchar,
  correo varchar,
  telefono varchar
);

CREATE TABLE choferes (
  id_chofer SERIAL PRIMARY KEY,
  rut_chofer varchar,
  nombre varchar,
  apellido varchar,
  contacto varchar,
  licencia varchar
);

CREATE TABLE vehiculos (
  id_vehiculo SERIAL PRIMARY KEY,
  patente varchar,
  modelo varchar,
  id_tipo_vehiculo int REFERENCES tipos_vehiculo (id_tipo_vehiculo),
  tarifa_base int,
  capacidad int
);

CREATE TABLE hechos_reservas (
  id_reserva int PRIMARY KEY,
  rut_pasajero int REFERENCES pasajeros (rut_pasajero),
  id_chofer int REFERENCES choferes (id_chofer),
  id_vehiculo int REFERENCES vehiculos (id_vehiculo),
  id_tipo_servicio int REFERENCES tipos_servicio (id_tipo_servicio),
  cant_pasajeros int,
  estado varchar,
  fecha date,
  hora time,
  origen varchar,
  destino varchar,
  monto_pago numeric,
  id_metodo_pago int REFERENCES metodos_pago (id_metodo_pago)
);

