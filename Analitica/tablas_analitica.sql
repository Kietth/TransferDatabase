-- Dimensión: pasajeros
CREATE TABLE dim_pasajeros (
  rut_pasajero INT PRIMARY KEY,
  nombre VARCHAR,
  apellido VARCHAR
);

-- Dimensión: choferes
CREATE TABLE dim_choferes (
  id_chofer SERIAL PRIMARY KEY,
  nombre VARCHAR,
  apellido VARCHAR
);

-- Dimensión: vehículos
CREATE TABLE dim_vehiculos (
  id_vehiculo SERIAL PRIMARY KEY,
  patente VARCHAR,
  modelo VARCHAR,
  clase VARCHAR
);

-- Dimensión: tipos de servicio
CREATE TABLE dim_tipos_servicio (
  id_tipo_servicio SERIAL PRIMARY KEY,
  nombre VARCHAR
);

-- Tabla de hechos para análisis
CREATE TABLE hechos_reservas_analisis (
  id_reserva INT PRIMARY KEY,
  rut_pasajero INT REFERENCES dim_pasajeros(rut_pasajero),
  id_chofer INT REFERENCES dim_choferes(id_chofer),
  id_vehiculo INT REFERENCES dim_vehiculos(id_vehiculo),
  id_tipo_servicio INT REFERENCES dim_tipos_servicio(id_tipo_servicio),
  fecha DATE,
  hora TIME,
  cant_pasajeros INT,
  estado VARCHAR,
  origen VARCHAR,
  destino VARCHAR,
  monto_pago NUMERIC,
  metodo_pago VARCHAR,
  fecha_carga_etl TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE etl_control (
  id SERIAL PRIMARY KEY,
  nombre_proceso VARCHAR(255) UNIQUE NOT NULL,
  ultima_fecha_carga DATE
);
