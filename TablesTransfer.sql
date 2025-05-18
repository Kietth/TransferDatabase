
CREATE TABLE "Hechos_Reservas" (
  "id_reserva" int PRIMARY KEY,
  "rut_pasajero" int,
  "id_chofer" int,
  "id_vehiculo" int,
  "cant_pasajeros" int,
  "estado" varchar,
  "tipo_servicio" varchar,
  "fecha" date,
  "hora" time,
  "origen" varchar,
  "destino" varchar,
  "monto_pago" numeric,
  "metodo_pago" varchar
);

CREATE TABLE "Pasajeros" (
  "rut_pasajero" int PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar,
  "correo" varchar,
  "telefono" varchar
);

CREATE TABLE "Choferes" (
  "id_chofer" int PRIMARY KEY,
  "rut_chofer" varchar,
  "nombre" varchar,
  "apellido" varchar,
  "contacto" varchar,
  "licencia" varchar
);

CREATE TABLE "Vehiculos" (
  "id_vehiculo" int PRIMARY KEY,
  "patente" varchar,
  "modelo" varchar,
  "clase" varchar,
  "tarifa_base" int,
  "capacidad" int
);

ALTER TABLE "Hechos_Reservas" ADD FOREIGN KEY ("rut_pasajero") REFERENCES "Pasajeros" ("rut_pasajero");

ALTER TABLE "Hechos_Reservas" ADD FOREIGN KEY ("id_chofer") REFERENCES "Choferes" ("id_chofer");

ALTER TABLE "Hechos_Reservas" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculos" ("id_vehiculo");

