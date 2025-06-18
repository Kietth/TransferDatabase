-- Insertar datos en tipos_servicio
insert into tipos_servicio (nombre) values
('Corporativo'),
('Domicilio'),
('Aeropuerto'),
('Turismo');

-- Insertar datos en tipos_vehiculo
insert into tipos_vehiculo (modelo, clase, capacidad, tarifa_base) values
('Hyundai H1', 'Van', 9, 25000),
('Toyota Corolla', 'Sedán', 4, 15000),
('Mercedes Sprinter', 'Minibus', 15, 30000),
('Chevrolet Spark', 'Compacto', 4, 12000),
('Kia Sorento', 'SUV', 6, 18000);

-- Insertar datos en choferes (nombres de tabla en minúscula)
INSERT INTO choferes (rut_chofer, nombre, apellido, contacto, licencia) VALUES
('12345678-9', 'Luis', 'Pérez', '987654321', 'A1'),
('98765432-1', 'Ana', 'Salazar', '912345678', 'A3'),
('24681357-5', 'Jorge', 'Cáceres', '911112222', 'A2'),
('13579246-8', 'Claudia', 'Vera', '933334444', 'A3'),
('11223344-5', 'Marcelo', 'Rivas', '955556666', 'A1');

-- Insertar datos en vehiculos (haciendo referencia a id_tipo_vehiculo)
insert into vehiculos (patente, id_tipo_vehiculo) values
('ABCD12', 1),
('EFGH34', 2),
('IJKL56', 3),
('MNOP78', 4),
('QRST90', 5);

