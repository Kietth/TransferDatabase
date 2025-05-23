INSERT INTO "Choferes" ("id_chofer", "rut_chofer", "nombre", "apellido", "contacto", "licencia") VALUES
(1, '12345678-9', 'Luis', 'Pérez', '987654321', 'A1'),
(2, '98765432-1', 'Ana', 'Salazar', '912345678', 'A3'),
(3, '24681357-5', 'Jorge', 'Cáceres', '911112222', 'A2'),
(4, '13579246-8', 'Claudia', 'Vera', '933334444', 'A3'),
(5, '11223344-5', 'Marcelo', 'Rivas', '955556666', 'A1');

INSERT INTO "Vehiculos" ("id_vehiculo", "patente", "modelo", "clase", "tarifa_base", "capacidad") VALUES
(1, 'ABCD12', 'Hyundai H1', 'Van', 25000, 9),
(2, 'EFGH34', 'Toyota Corolla', 'Sedán', 15000, 4),
(3, 'IJKL56', 'Mercedes Sprinter', 'Minibús', 30000, 15),
(4, 'MNOP78', 'Chevrolet Spark', 'Compacto', 12000, 4),
(5, 'QRST90', 'Kia Sorento', 'SUV', 18000, 6);

INSERT INTO "Pasajeros" ("rut_pasajero", "nombre", "apellido", "correo", "telefono") VALUES
(8096979, 'Carlos', 'Muñoz', 'carlos.muñoz@gmail.com', '950730743'),
(6097654, 'María', 'Gómez', 'maría.gómez@gmail.com', '992212895'),
(17369727, 'Javier', 'Torres', 'javier.torres@gmail.com', '928573093'),
(6314793, 'Fernanda', 'Paredes', 'fernanda.paredes@gmail.com', '926989577'),
(9877027, 'Diego', 'Ramírez', 'diego.ramírez@gmail.com', '993152296'),
(12683848, 'Andrea', 'Sánchez', 'andrea.sánchez@gmail.com', '956070558'),
(23011330, 'Luis', 'Pérez', 'luis.pérez@gmail.com', '942276070'),
(11519952, 'Valentina', 'Morales', 'valentina.morales@gmail.com', '982393491'),
(8329004, 'Ignacio', 'Castillo', 'ignacio.castillo@gmail.com', '985759059'),
(7061151, 'Camila', 'Navarro', 'camila.navarro@gmail.com', '951274124'),
(15995699, 'José', 'Silva', 'josé.silva@gmail.com', '954293962'),
(7071610, 'Sofía', 'Fuentes', 'sofía.fuentes@gmail.com', '959991542'),
(10571550, 'Sebastián', 'Rojas', 'sebastián.rojas@gmail.com', '947593932'),
(11376836, 'Antonia', 'Gallardo', 'antonia.gallardo@gmail.com', '997115896'),
(18977355, 'Matías', 'Herrera', 'matías.herrera@gmail.com', '935854696'),
(22311319, 'Isidora', 'López', 'isidora.lópez@gmail.com', '999172131'),
(6453536, 'Benjamín', 'Vargas', 'benjamín.vargas@gmail.com', '915661214'),
(23776091, 'Trinidad', 'Reyes', 'trinidad.reyes@gmail.com', '993846834'),
(21006342, 'Tomás', 'Contreras', 'tomás.contreras@gmail.com', '942276718'),
(22504777, 'Martina', 'Espinoza', 'martina.espinoza@gmail.com', '998022989');

INSERT INTO "Hechos_Reservas" ("id_reserva", "rut_pasajero", "id_chofer", "id_vehiculo", "cant_pasajeros", "estado", "tipo_servicio", "fecha", "hora", "origen", "destino", "monto_pago", "metodo_pago")
values

--Datos 2024
(2024001, 22504777, 3, 3, 4, 'Cancelado', 'A Domicilio', '2024-01-17', '15:00', 'Isla Teja', 'Calle Baquedano', 8000, 'Transferencia'),
(2024002, 17369727, 2, 3, 2, 'Completado', 'Corporativo', '2024-01-01', '9:30', 'Terminal', 'Hotel Dreams', 10000, 'Transferencia'),
(2024003, 10571550, 3, 2, 6, 'Completado', 'Turismo', '2024-01-16', '16:45', 'UACH', 'Niebla', 75000, 'Transferencia'),
(2024004, 11376836, 2, 5, 11, 'Completado', 'Aeropuerto', '2024-01-27', '10:15', 'Terminal', 'Aeropuerto', 8000, 'Transferencia'),
(2024005, 9877027, 2, 5, 15, 'Completado', 'Turismo', '2024-01-17', '7:00', 'Terminal', 'Niebla', 40000, 'Transferencia'),
(2024006, 7071610, 5, 3, 3, 'Completado', 'Corporativo', '2024-01-15', '15:30', 'Terminal', 'Hotel Dreams', 60000, 'Transferencia'),
(2024007, 18977355, 5, 5, 5, 'Completado', 'Corporativo', '2024-01-18', '13:45', 'Isla Teja', 'Hotel Dreams', 25000, 'Transferencia'),
(2024008, 9877027, 5, 2, 8, 'Completado', 'Turismo', '2024-01-18', '11:15', 'Isla Teja', 'Niebla', 8000, 'Efectivo'),
(2024009, 6314793, 4, 5, 5, 'Completado', 'Turismo', '2024-02-27', '7:00', 'Terminal', 'Niebla', 25000, 'Transferencia'),
(2024010, 12683848, 1, 3, 15, 'Cancelado', 'Aeropuerto', '2024-02-12', '11:00', 'UACH', 'Aeropuerto', 30000, 'Transferencia'),
(2024011, 11376836, 2, 5, 13, 'Completado', 'Turismo', '2024-02-16', '17:15', 'Supermercado', 'Parque Oncol', 12000, 'Efectivo'),
(2024012, 12683848, 1, 4, 12, 'Completado', 'Turismo', '2024-02-06', '16:30', 'Centro', 'Niebla', 30000, 'Transferencia'),
(2024013, 6097654, 3, 2, 3, 'Completado', 'A Domicilio', '2024-02-21', '16:15', 'Isla Teja', 'Calle Baquedano', 40000, 'Transferencia'),
(2024014, 6314793, 4, 3, 8, 'Completado', 'A Domicilio', '2024-02-09', '16:30', 'Centro', 'Calle Baquedano', 10000, 'Efectivo'),
(2024015, 18977355, 2, 4, 7, 'Completado', 'Turismo', '2024-02-15', '8:30', 'Terminal', 'Niebla', 40000, 'Transferencia'),
(2024016, 22504777, 2, 4, 10, 'Completado', 'Corporativo', '2024-02-10', '12:15', 'Terminal', 'Hotel Dreams', 30000, 'Efectivo'),
(2024017, 23011330, 3, 1, 11, 'Completado', 'Aeropuerto', '2024-02-23', '14:00', 'Isla Teja', 'Aeropuerto', 30000, 'Efectivo'),
(2024018, 7061151, 5, 4, 5, 'Completado', 'Aeropuerto', '2024-02-12', '8:15', 'Centro', 'Aeropuerto', 25000, 'Efectivo'),
(2024019, 6314793, 1, 1, 9, 'Cancelado', 'Turismo', '2024-03-26', '18:45', 'UACH', 'Niebla', 18000, 'Transferencia'),
(2024020, 11376836, 4, 5, 5, 'Completado', 'Turismo', '2024-03-21', '8:45', 'UACH', 'Niebla', 18000, 'Efectivo'),
(2024021, 18977355, 3, 1, 8, 'Completado', 'Turismo', '2024-03-13', '9:15', 'UACH', 'Niebla', 12000, 'Transferencia'),
(2024022, 6097654, 5, 3, 9, 'Completado', 'Aeropuerto', '2024-03-11', '18:45', 'Centro', 'Aeropuerto', 60000, 'Efectivo'),
(2024023, 22504777, 4, 3, 10, 'Completado', 'Turismo', '2024-03-11', '17:45', 'Terminal', 'Niebla', 40000, 'Efectivo'),
(2024024, 22504777, 3, 1, 5, 'Completado', 'Turismo', '2024-03-23', '17:45', 'UACH', 'Parque Oncol', 75000, 'Efectivo'),
(2024025, 10571550, 2, 4, 3, 'Completado', 'Turismo', '2024-03-26', '10:15', 'UACH', 'Niebla', 40000, 'Efectivo'),
(2024026, 23776091, 3, 5, 8, 'Completado', 'Turismo', '2024-03-03', '10:00', 'Isla Teja', 'Niebla', 75000, 'Transferencia'),
(2024027, 7061151, 1, 3, 5, 'Completado', 'A Domicilio', '2024-04-16', '12:45', 'Centro', 'Calle Baquedano', 10000, 'Transferencia'),
(2024028, 23776091, 5, 5, 15, 'Cancelado', 'A Domicilio', '2024-04-28', '12:30', 'UACH', 'Calle Baquedano', 18000, 'Transferencia'),
(2024029, 22504777, 5, 1, 5, 'Completado', 'A Domicilio', '2024-04-19', '7:45', 'Isla Teja', 'Calle Baquedano', 8000, 'Efectivo'),
(2024030, 15995699, 4, 3, 5, 'Completado', 'Corporativo', '2024-04-23', '9:15', 'Supermercado', 'Hotel Dreams', 60000, 'Transferencia'),
(2024031, 7061151, 2, 5, 5, 'Completado', 'Aeropuerto', '2024-05-28', '10:30', 'Terminal', 'Aeropuerto', 40000, 'Transferencia'),
(2024032, 17369727, 3, 1, 6, 'Completado', 'A Domicilio', '2024-05-11', '19:15', 'Isla Teja', 'Calle Baquedano', 40000, 'Efectivo'),
(2024033, 6097654, 5, 1, 3, 'Completado', 'Turismo', '2024-05-20', '20:30', 'Centro', 'Niebla', 60000, 'Transferencia'),
(2024034, 9877027, 2, 2, 2, 'Completado', 'Turismo', '2024-05-05', '11:30', 'Terminal', 'Niebla', 75000, 'Efectivo'),
(2024035, 8329004, 4, 2, 4, 'Completado', 'A Domicilio', '2024-05-06', '15:00', 'Supermercado', 'Calle Baquedano', 12000, 'Efectivo'),
(2024036, 23776091, 3, 5, 1, 'Completado', 'A Domicilio', '2024-05-26', '12:45', 'Isla Teja', 'Calle Baquedano', 30000, 'Efectivo'),
(2024037, 6453536, 3, 1, 7, 'Cancelado', 'Aeropuerto', '2024-05-23', '9:15', 'Isla Teja', 'Aeropuerto', 60000, 'Transferencia'),
(2024038, 11376836, 1, 5, 2, 'Completado', 'Aeropuerto', '2024-05-26', '20:00', 'UACH', 'Aeropuerto', 12000, 'Efectivo'),
(2024039, 7071610, 3, 4, 15, 'Completado', 'Aeropuerto', '2024-05-05', '15:00', 'Supermercado', 'Aeropuerto', 10000, 'Efectivo'),
(2024040, 8096979, 2, 2, 15, 'Completado', 'A Domicilio', '2024-06-22', '19:15', 'Supermercado', 'Calle Baquedano', 18000, 'Transferencia'),
(2024041, 22311319, 5, 4, 8, 'Completado', 'A Domicilio', '2024-06-07', '17:45', 'Isla Teja', 'Calle Baquedano', 25000, 'Efectivo'),
(2024042, 17369727, 4, 5, 13, 'Completado', 'Turismo', '2024-06-28', '15:45', 'Centro', 'Niebla', 40000, 'Efectivo'),
(2024043, 7071610, 5, 4, 6, 'Completado', 'A Domicilio', '2024-06-16', '15:15', 'Terminal', 'Calle Baquedano', 25000, 'Efectivo'),
(2024044, 12683848, 3, 5, 13, 'Completado', 'Turismo', '2024-06-24', '12:15', 'Terminal', 'Parque Oncol', 30000, 'Efectivo'),
(2024045, 12683848, 2, 4, 12, 'Completado', 'Aeropuerto', '2024-06-18', '13:15', 'UACH', 'Aeropuerto', 40000, 'Efectivo'),
(2024046, 12683848, 4, 4, 10, 'Cancelado', 'Turismo', '2024-06-18', '14:15', 'Centro', 'Parque Oncol', 25000, 'Transferencia'),
(2024047, 23011330, 4, 4, 6, 'Completado', 'Corporativo', '2024-06-22', '9:15', 'Supermercado', 'Hotel Dreams', 10000, 'Efectivo'),
(2024048, 22311319, 1, 2, 2, 'Completado', 'Corporativo', '2024-06-18', '20:15', 'Terminal', 'Hotel Dreams', 10000, 'Transferencia'),
(2024049, 18977355, 2, 3, 3, 'Completado', 'Turismo', '2024-07-10', '15:45', 'UACH', 'Niebla', 30000, 'Transferencia'),
(2024050, 9877027, 3, 3, 12, 'Completado', 'Turismo', '2024-07-21', '20:15', 'Isla Teja', 'Parque Oncol', 60000, 'Efectivo'),
(2024051, 17369727, 2, 4, 10, 'Completado', 'Corporativo', '2024-07-06', '10:30', 'Centro', 'Hotel Dreams', 75000, 'Transferencia'),
(2024052, 18977355, 1, 1, 5, 'Completado', 'Turismo', '2024-07-04', '17:15', 'Supermercado', 'Niebla', 60000, 'Transferencia'),
(2024053, 15995699, 4, 4, 7, 'Completado', 'Turismo', '2024-07-09', '14:30', 'Centro', 'Niebla', 18000, 'Transferencia'),
(2024054, 22504777, 2, 5, 10, 'Completado', 'Aeropuerto', '2024-07-11', '17:30', 'Terminal', 'Aeropuerto', 18000, 'Efectivo'),
(2024055, 15995699, 2, 3, 4, 'Cancelado', 'Aeropuerto', '2024-08-08', '16:15', 'UACH', 'Aeropuerto', 60000, 'Transferencia'),
(2024056, 7061151, 5, 3, 1, 'Completado', 'Turismo', '2024-08-22', '19:45', 'Centro', 'Niebla', 10000, 'Transferencia'),
(2024057, 22504777, 4, 4, 7, 'Completado', 'Aeropuerto', '2024-08-20', '13:15', 'Supermercado', 'Aeropuerto', 30000, 'Efectivo'),
(2024058, 7071610, 5, 3, 14, 'Completado', 'A Domicilio', '2024-08-07', '8:15', 'Supermercado', 'Calle Baquedano', 60000, 'Efectivo'),
(2024059, 22311319, 4, 1, 10, 'Completado', 'Turismo', '2024-08-26', '15:15', 'Isla Teja', 'Parque Oncol', 8000, 'Efectivo'),
(2024060, 18977355, 4, 4, 8, 'Completado', 'Turismo', '2024-08-27', '10:15', 'Isla Teja', 'Parque Oncol', 40000, 'Transferencia'),
(2024061, 17369727, 3, 2, 15, 'Completado', 'Turismo', '2024-08-03', '8:45', 'Isla Teja', 'Parque Oncol', 18000, 'Transferencia'),
(2024062, 8096979, 1, 1, 12, 'Completado', 'Turismo', '2024-08-27', '15:15', 'UACH', 'Parque Oncol', 30000, 'Efectivo'),
(2024063, 22311319, 1, 5, 10, 'Completado', 'Aeropuerto', '2024-08-25', '15:30', 'Terminal', 'Aeropuerto', 25000, 'Efectivo'),
(2024064, 8329004, 4, 2, 9, 'Cancelado', 'Aeropuerto', '2024-09-23', '15:30', 'UACH', 'Aeropuerto', 25000, 'Transferencia'),
(2024065, 18977355, 5, 1, 7, 'Completado', 'Corporativo', '2024-09-16', '13:15', 'Isla Teja', 'Hotel Dreams', 12000, 'Efectivo'),
(2024066, 7071610, 2, 4, 15, 'Completado', 'Corporativo', '2024-09-20', '9:15', 'Supermercado', 'Hotel Dreams', 60000, 'Efectivo'),
(2024067, 12683848, 5, 5, 8, 'Completado', 'Corporativo', '2024-09-01', '13:30', 'Centro', 'Hotel Dreams', 75000, 'Transferencia'),
(2024068, 10571550, 5, 5, 5, 'Completado', 'Turismo', '2024-09-09', '18:30', 'Centro', 'Niebla', 18000, 'Efectivo'),
(2024069, 22311319, 1, 5, 3, 'Completado', 'Turismo', '2024-10-09', '18:15', 'Isla Teja', 'Parque Oncol', 60000, 'Transferencia'),
(2024070, 8329004, 2, 2, 2, 'Completado', 'Turismo', '2024-10-03', '13:45', 'Terminal', 'Niebla', 12000, 'Efectivo'),
(2024071, 22504777, 3, 3, 7, 'Completado', 'Turismo', '2024-10-01', '17:15', 'Isla Teja', 'Niebla', 25000, 'Transferencia'),
(2024072, 22504777, 1, 5, 15, 'Completado', 'A Domicilio', '2024-10-28', '14:15', 'Terminal', 'Calle Baquedano', 30000, 'Transferencia'),
(2024073, 6314793, 3, 1, 13, 'Cancelado', 'A Domicilio', '2024-11-01', '14:15', 'Supermercado', 'Calle Baquedano', 60000, 'Efectivo'),
(2024074, 6097654, 2, 3, 13, 'Completado', 'Turismo', '2024-11-16', '18:15', 'UACH', 'Niebla', 12000, 'Efectivo'),
(2024075, 10571550, 4, 5, 10, 'Completado', 'Turismo', '2024-11-04', '18:45', 'Centro', 'Parque Oncol', 30000, 'Efectivo'),
(2024076, 7071610, 4, 5, 9, 'Completado', 'Corporativo', '2024-11-15', '17:30', 'Terminal', 'Hotel Dreams', 30000, 'Transferencia'),
(2024077, 15995699, 2, 1, 3, 'Completado', 'Turismo', '2024-11-03', '9:45', 'Centro', 'Niebla', 8000, 'Efectivo'),
(2024078, 17369727, 5, 2, 11, 'Completado', 'A Domicilio', '2024-11-15', '19:15', 'Isla Teja', 'Calle Baquedano', 40000, 'Efectivo'),
(2024079, 8329004, 4, 5, 9, 'Completado', 'Corporativo', '2024-11-25', '9:30', 'Supermercado', 'Hotel Dreams', 40000, 'Efectivo'),
(2024080, 15995699, 3, 3, 11, 'Completado', 'Aeropuerto', '2024-12-20', '7:00', 'Isla Teja', 'Aeropuerto', 8000, 'Efectivo'),
(2024081, 23011330, 2, 5, 1, 'Completado', 'Turismo', '2024-12-10', '8:45', 'Terminal', 'Niebla', 18000, 'Transferencia'),
(2024082, 9877027, 5, 4, 13, 'Cancelado', 'Aeropuerto', '2024-12-14', '12:00', 'Centro', 'Aeropuerto', 60000, 'Efectivo'),
(2024083, 11376836, 5, 3, 7, 'Completado', 'Turismo', '2024-12-12', '16:00', 'Supermercado', 'Parque Oncol', 18000, 'Efectivo'),
(2024084, 23776091, 5, 2, 5, 'Completado', 'Turismo', '2024-12-03', '13:00', 'Supermercado', 'Parque Oncol', 30000, 'Efectivo'),
(2024085, 18977355, 2, 4, 15, 'Completado', 'A Domicilio', '2024-12-27', '18:30', 'Centro', 'Calle Baquedano', 60000, 'Efectivo'),
(2024086, 6314793, 4, 4, 6, 'Completado', 'A Domicilio', '2024-12-02', '12:15', 'Supermercado', 'Calle Baquedano', 18000, 'Transferencia'),
(2024087, 11376836, 5, 4, 13, 'Completado', 'A Domicilio', '2024-12-05', '12:15', 'Isla Teja', 'Calle Baquedano', 8000, 'Transferencia'),
(2024088, 23011330, 1, 4, 7, 'Completado', 'Corporativo', '2024-12-22', '8:30', 'UACH', 'Hotel Dreams', 75000, 'Efectivo'),
(2024089, 7071610, 1, 3, 14, 'Completado', 'Aeropuerto', '2024-12-28', '18:15', 'UACH', 'Aeropuerto', 12000, 'Transferencia'),

--Datos 2023
(2023001, 6097654, 4, 5, 3, 'Completado', 'Corporativo', '2023-01-20', '16:15', 'Supermercado', 'Hotel Dreams', 40000, 'Transferencia'),
(2023002, 7071610, 2, 3, 2, 'Completado', 'Corporativo', '2023-01-04', '13:00', 'Isla Teja', 'Hotel Dreams', 8000, 'Efectivo'),
(2023003, 23011330, 1, 1, 4, 'Completado', 'Aeropuerto', '2023-01-15', '9:15', 'Supermercado', 'Aeropuerto', 25000, 'Transferencia'),
(2023004, 6314793, 1, 1, 12, 'Completado', 'Corporativo', '2023-01-17', '18:45', 'Centro', 'Hotel Dreams', 12000, 'Efectivo'),
(2023005, 10571550, 4, 5, 8, 'Completado', 'A Domicilio', '2023-01-14', '12:00', 'Centro', 'Calle Baquedano', 8000, 'Efectivo'),
(2023006, 8096979, 2, 5, 9, 'Completado', 'Corporativo', '2023-01-13', '9:15', 'Supermercado', 'Hotel Dreams', 8000, 'Efectivo'),
(2023007, 22504777, 3, 4, 10, 'Completado', 'Aeropuerto', '2023-01-17', '15:00', 'UACH', 'Aeropuerto', 60000, 'Efectivo'),
(2023008, 6453536, 1, 5, 12, 'Completado', 'A Domicilio', '2023-01-23', '17:15', 'Isla Teja', 'Calle Baquedano', 10000, 'Transferencia'),
(2023009, 15995699, 1, 2, 12, 'Completado', 'Turismo', '2023-01-09', '9:30', 'Centro', 'Parque Oncol', 18000, 'Transferencia'),
(2023010, 21006342, 1, 5, 12, 'Completado', 'Corporativo', '2023-01-08', '19:30', 'Isla Teja', 'Hotel Dreams', 10000, 'Transferencia'),
(2023011, 11376836, 2, 3, 7, 'Completado', 'A Domicilio', '2023-02-27', '8:15', 'Supermercado', 'Calle Baquedano', 40000, 'Transferencia'),
(2023012, 8096979, 4, 2, 5, 'Completado', 'Corporativo', '2023-02-02', '20:00', 'Centro', 'Hotel Dreams', 8000, 'Transferencia'),
(2023013, 8329004, 4, 3, 4, 'Cancelado', 'Turismo', '2023-02-06', '18:00', 'Isla Teja', 'Parque Oncol', 10000, 'Transferencia'),
(2023014, 11376836, 1, 4, 14, 'Completado', 'Aeropuerto', '2023-02-07', '11:15', 'UACH', 'Aeropuerto', 40000, 'Transferencia'),
(2023015, 11376836, 1, 5, 9, 'Completado', 'Corporativo', '2023-02-28', '11:15', 'UACH', 'Hotel Dreams', 18000, 'Transferencia'),
(2023016, 11519952, 1, 5, 5, 'Completado', 'Corporativo', '2023-02-17', '14:00', 'Supermercado', 'Hotel Dreams', 18000, 'Efectivo'),
(2023017, 8096979, 4, 4, 3, 'Completado', 'Aeropuerto', '2023-02-28', '19:00', 'Terminal', 'Aeropuerto', 40000, 'Efectivo'),
(2023018, 11519952, 2, 2, 5, 'Completado', 'Turismo', '2023-03-02', '10:00', 'Supermercado', 'Parque Oncol', 10000, 'Efectivo'),
(2023019, 21006342, 3, 5, 11, 'Completado', 'Aeropuerto', '2023-03-24', '11:45', 'Isla Teja', 'Aeropuerto', 75000, 'Transferencia'),
(2023020, 9877027, 4, 4, 5, 'Completado', 'A Domicilio', '2023-03-23', '15:30', 'Supermercado', 'Calle Baquedano', 40000, 'Efectivo'),
(2023021, 15995699, 2, 1, 12, 'Cancelado', 'Turismo', '2023-03-17', '14:30', 'Supermercado', 'Parque Oncol', 25000, 'Transferencia'),
(2023022, 7071610, 3, 2, 4, 'Completado', 'Turismo', '2023-04-13', '9:15', 'UACH', 'Niebla', 40000, 'Transferencia'),
(2023023, 17369727, 4, 3, 10, 'Completado', 'Turismo', '2023-04-10', '18:30', 'Isla Teja', 'Niebla', 8000, 'Transferencia'),
(2023024, 6453536, 3, 2, 2, 'Completado', 'Turismo', '2023-04-07', '11:15', 'UACH', 'Parque Oncol', 10000, 'Transferencia'),
(2023025, 18977355, 1, 5, 9, 'Completado', 'Turismo', '2023-04-15', '14:15', 'Centro', 'Niebla', 60000, 'Transferencia'),
(2023026, 22504777, 5, 1, 10, 'Completado', 'Turismo', '2023-05-19', '8:30', 'UACH', 'Parque Oncol', 18000, 'Efectivo'),
(2023027, 23011330, 2, 1, 15, 'Completado', 'Turismo', '2023-05-18', '16:30', 'UACH', 'Parque Oncol', 8000, 'Efectivo'),
(2023028, 23776091, 1, 3, 10, 'Completado', 'Corporativo', '2023-05-26', '10:30', 'Supermercado', 'Hotel Dreams', 18000, 'Transferencia'),
(2023029, 6314793, 5, 3, 7, 'Completado', 'Corporativo', '2023-05-01', '19:45', 'Supermercado', 'Hotel Dreams', 25000, 'Efectivo'),
(2023030, 11519952, 5, 4, 14, 'Completado', 'Turismo', '2023-05-02', '15:00', 'Centro', 'Niebla', 75000, 'Transferencia'),
(2023031, 12683848, 2, 5, 15, 'Completado', 'A Domicilio', '2023-05-10', '13:15', 'Isla Teja', 'Calle Baquedano', 12000, 'Transferencia'),
(2023032, 23011330, 3, 5, 13, 'Completado', 'Turismo', '2023-05-07', '10:00', 'Isla Teja', 'Niebla', 75000, 'Efectivo'),
(2023033, 15995699, 1, 1, 9, 'Completado', 'A Domicilio', '2023-05-05', '15:30', 'Terminal', 'Calle Baquedano', 30000, 'Transferencia'),
(2023034, 6314793, 5, 4, 11, 'Completado', 'Turismo', '2023-05-12', '9:00', 'Centro', 'Parque Oncol', 8000, 'Transferencia'),
(2023035, 22504777, 5, 2, 11, 'Completado', 'Corporativo', '2023-06-19', '18:45', 'Centro', 'Hotel Dreams', 10000, 'Transferencia'),
(2023036, 18977355, 4, 1, 9, 'Completado', 'Turismo', '2023-06-05', '20:45', 'Isla Teja', 'Parque Oncol', 12000, 'Transferencia'),
(2023037, 21006342, 1, 2, 4, 'Completado', 'Turismo', '2023-06-17', '10:00', 'UACH', 'Niebla', 10000, 'Transferencia'),
(2023038, 6097654, 5, 1, 11, 'Completado', 'Corporativo', '2023-06-15', '14:15', 'Centro', 'Hotel Dreams', 40000, 'Efectivo'),
(2023039, 10571550, 5, 2, 13, 'Completado', 'Corporativo', '2023-06-27', '10:30', 'Supermercado', 'Hotel Dreams', 12000, 'Efectivo'),
(2023040, 7061151, 2, 4, 8, 'Completado', 'Aeropuerto', '2023-06-16', '20:15', 'Supermercado', 'Aeropuerto', 60000, 'Efectivo'),
(2023041, 10571550, 3, 1, 5, 'Completado', 'Turismo', '2023-06-21', '14:15', 'Terminal', 'Parque Oncol', 75000, 'Transferencia'),
(2023042, 17369727, 1, 4, 13, 'Completado', 'A Domicilio', '2023-07-15', '9:00', 'Supermercado', 'Calle Baquedano', 10000, 'Efectivo'),
(2023043, 22311319, 4, 3, 4, 'Completado', 'Aeropuerto', '2023-07-23', '18:30', 'Isla Teja', 'Aeropuerto', 30000, 'Transferencia'),
(2023044, 18977355, 3, 4, 9, 'Completado', 'A Domicilio', '2023-07-23', '20:00', 'Centro', 'Calle Baquedano', 30000, 'Transferencia'),
(2023045, 6097654, 5, 5, 7, 'Completado', 'Aeropuerto', '2023-07-23', '13:15', 'Centro', 'Aeropuerto', 8000, 'Transferencia'),
(2023046, 11519952, 4, 5, 9, 'Completado', 'Aeropuerto', '2023-07-09', '13:45', 'Centro', 'Aeropuerto', 8000, 'Transferencia'),
(2023047, 7061151, 5, 5, 10, 'Completado', 'A Domicilio', '2023-07-26', '11:15', 'Centro', 'Calle Baquedano', 75000, 'Transferencia'),
(2023048, 11376836, 3, 4, 6, 'Completado', 'Turismo', '2023-07-08', '8:00', 'Supermercado', 'Parque Oncol', 30000, 'Efectivo'),
(2023049, 22311319, 5, 5, 11, 'Cancelado', 'Corporativo', '2023-08-18', '15:45', 'Isla Teja', 'Hotel Dreams', 25000, 'Efectivo'),
(2023050, 8329004, 1, 2, 8, 'Completado', 'A Domicilio', '2023-08-04', '13:45', 'Supermercado', 'Calle Baquedano', 12000, 'Transferencia'),
(2023051, 8329004, 1, 1, 6, 'Completado', 'Turismo', '2023-08-23', '13:45', 'Centro', 'Niebla', 8000, 'Efectivo'),
(2023052, 11519952, 3, 1, 10, 'Cancelado', 'A Domicilio', '2023-08-04', '16:45', 'Centro', 'Calle Baquedano', 75000, 'Efectivo'),
(2023053, 7071610, 5, 2, 9, 'Completado', 'Corporativo', '2023-08-28', '19:00', 'Supermercado', 'Hotel Dreams', 40000, 'Transferencia'),
(2023054, 21006342, 2, 1, 9, 'Completado', 'Aeropuerto', '2023-09-26', '9:45', 'UACH', 'Aeropuerto', 60000, 'Efectivo'),
(2023055, 11519952, 2, 4, 5, 'Completado', 'Aeropuerto', '2023-09-08', '19:30', 'Terminal', 'Aeropuerto', 25000, 'Efectivo'),
(2023056, 17369727, 1, 3, 4, 'Completado', 'A Domicilio', '2023-09-13', '14:30', 'Terminal', 'Calle Baquedano', 75000, 'Efectivo'),
(2023057, 23776091, 4, 2, 5, 'Cancelado', 'Turismo', '2023-09-10', '8:00', 'Isla Teja', 'Parque Oncol', 12000, 'Efectivo'),
(2023058, 15995699, 1, 3, 11, 'Completado', 'Aeropuerto', '2023-09-05', '18:15', 'UACH', 'Aeropuerto', 75000, 'Transferencia'),
(2023059, 22311319, 3, 2, 7, 'Completado', 'Turismo', '2023-09-27', '11:15', 'UACH', 'Parque Oncol', 40000, 'Efectivo'),
(2023060, 6453536, 5, 1, 5, 'Completado', 'Turismo', '2023-09-07', '14:45', 'Supermercado', 'Parque Oncol', 75000, 'Efectivo'),
(2023061, 23011330, 2, 1, 1, 'Completado', 'A Domicilio', '2023-09-16', '7:15', 'Terminal', 'Calle Baquedano', 25000, 'Transferencia'),
(2023062, 23776091, 3, 3, 10, 'Completado', 'Turismo', '2023-10-23', '9:30', 'UACH', 'Parque Oncol', 40000, 'Transferencia'),
(2023063, 11519952, 4, 1, 1, 'Completado', 'Turismo', '2023-10-14', '14:00', 'UACH', 'Parque Oncol', 75000, 'Transferencia'),
(2023064, 7061151, 5, 4, 10, 'Cancelado', 'Corporativo', '2023-10-17', '9:45', 'Centro', 'Hotel Dreams', 18000, 'Efectivo'),
(2023065, 23011330, 1, 1, 7, 'Completado', 'Corporativo', '2023-10-13', '16:45', 'Supermercado', 'Hotel Dreams', 60000, 'Transferencia'),
(2023066, 6453536, 4, 1, 2, 'Completado', 'Turismo', '2023-11-23', '19:00', 'Centro', 'Niebla', 30000, 'Transferencia'),
(2023067, 11519952, 2, 3, 5, 'Completado', 'Corporativo', '2023-11-21', '13:45', 'UACH', 'Hotel Dreams', 60000, 'Transferencia'),
(2023068, 8329004, 3, 4, 3, 'Completado', 'Corporativo', '2023-11-17', '15:45', 'Terminal', 'Hotel Dreams', 10000, 'Efectivo'),
(2023069, 23776091, 2, 3, 15, 'Completado', 'Corporativo', '2023-11-24', '19:30', 'Terminal', 'Hotel Dreams', 12000, 'Transferencia'),
(2023070, 12683848, 5, 2, 4, 'Completado', 'Turismo', '2023-11-26', '10:30', 'Centro', 'Parque Oncol', 12000, 'Transferencia'),
(2023071, 18977355, 5, 3, 5, 'Cancelado', 'Aeropuerto', '2023-11-06', '20:00', 'UACH', 'Aeropuerto', 40000, 'Transferencia'),
(2023072, 17369727, 1, 4, 11, 'Completado', 'Corporativo', '2023-12-09', '18:45', 'Terminal', 'Hotel Dreams', 75000, 'Efectivo'),
(2023073, 7071610, 2, 1, 4, 'Completado', 'Corporativo', '2023-12-06', '19:00', 'Terminal', 'Hotel Dreams', 8000, 'Efectivo'),
(2023074, 23011330, 1, 3, 5, 'Completado', 'Turismo', '2023-12-12', '7:00', 'Isla Teja', 'Parque Oncol', 60000, 'Efectivo'),
(2023075, 6453536, 1, 3, 3, 'Completado', 'Corporativo', '2023-12-25', '13:00', 'UACH', 'Hotel Dreams', 25000, 'Transferencia'),
(2023076, 7071610, 5, 2, 12, 'Completado', 'Turismo', '2023-12-05', '19:00', 'UACH', 'Parque Oncol', 30000, 'Transferencia');