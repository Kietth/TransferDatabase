-- Insertar datos en dim_tipos_servicio
insert into dim_tipos_servicio (nombre) values
('Corporativo'),
('Domicilio'),
('Aeropuerto'),
('Turismo');


-- Insertar datos en dim_vehiculos
insert into dim_vehiculos (patente, modelo, clase) values
('ABCD12', 'Hyundai H1', 'Van'),
('EFGH34', 'Toyota Corolla', 'Sedán'),
('IJKL56', 'Mercedes Sprinter', 'Minibus'),
('MNOP78', 'Chevrolet Spark', 'Compacto'),
('QRST90', 'Kia Sorento', 'SUV');

-- Insertar datos en dim_choferes 
INSERT INTO dim_choferes (nombre, apellido) VALUES
('Luis', 'Pérez'),
('Ana', 'Salazar'),
('Jorge', 'Cáceres'),
('Claudia', 'Vera'),
('Marcelo', 'Rivas');
