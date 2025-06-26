CREATE TABLE tipos_servicio (
  id_tipo_servicio SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL
);

-- Tabla: tipos de vehículo
CREATE TABLE tipos_vehiculo (
  id_tipo_vehiculo SERIAL PRIMARY KEY,
  modelo VARCHAR,
  clase VARCHAR NOT NULL,
  capacidad INT,
  tarifa_base INT
);

-- Tabla: pasajeros
CREATE TABLE pasajeros (
  rut_pasajero INT PRIMARY KEY,
  nombre VARCHAR,
  apellido VARCHAR,
  correo VARCHAR,
  telefono VARCHAR
);

-- Tabla: choferes
CREATE TABLE choferes (
  id_chofer SERIAL PRIMARY KEY,
  rut_chofer VARCHAR,
  nombre VARCHAR,
  apellido VARCHAR,
  contacto VARCHAR,
  licencia VARCHAR
);

-- Tabla: vehículos
CREATE TABLE vehiculos (
  id_vehiculo SERIAL PRIMARY KEY,
  patente VARCHAR,
  id_tipo_vehiculo INT REFERENCES tipos_vehiculo(id_tipo_vehiculo)
);

-- Tabla de hechos: reservas
CREATE TABLE hechos_reservas (
  id_reserva SERIAL PRIMARY KEY,
  rut_pasajero INT REFERENCES pasajeros(rut_pasajero),
  id_chofer INT REFERENCES choferes(id_chofer),
  id_vehiculo INT REFERENCES vehiculos(id_vehiculo),
  id_tipo_servicio INT REFERENCES tipos_servicio(id_tipo_servicio),
  cant_pasajeros INT,
  estado VARCHAR,
  fecha DATE,
  hora TIME,
  origen VARCHAR,
  destino VARCHAR,
  monto_pago NUMERIC,
  metodo_pago VARCHAR
);