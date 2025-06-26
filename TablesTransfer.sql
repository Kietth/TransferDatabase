CREATE TABLE tipos_servicio (
  id_tipo_servicio SERIAL PRIMARY KEY,
  nombre varchar NOT NULL
);

CREATE TABLE tipos_vehiculo (
  id_tipo_vehiculo SERIAL PRIMARY KEY,
  modelo varchar,
  clase varchar NOT NULL,
  capacidad int,
  tarifa_base int
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
  id_tipo_vehiculo int REFERENCES tipos_vehiculo (id_tipo_vehiculo)
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
  metodo_pago varchar
);

CREATE TABLE hechos_reservas_analisis (
  id_reserva int PRIMARY KEY,
  rut_pasajero int,
  id_chofer int,
  id_vehiculo int,
  id_tipo_servicio int,
  cant_pasajeros int,
  estado varchar,
  fecha date,
  hora time,
  origen varchar,
  destino varchar,
  monto_pago numeric,
  metodo_pago varchar,
  fecha_carga_etl timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE etl_control (
    id SERIAL PRIMARY KEY,
    nombre_proceso VARCHAR(255) UNIQUE NOT NULL,
    ultima_fecha_carga DATE
);

INSERT INTO etl_control (nombre_proceso, ultima_fecha_carga)
VALUES ('reservas_etl', '1900-01-01')
ON CONFLICT (nombre_proceso) DO NOTHING;
