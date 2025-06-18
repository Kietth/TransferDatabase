import random
import csv

nombres = [
    'Juan', 'María', 'Pedro', 'Ana', 'Luis', 'Sofía', 'Diego', 'Camila', 'Javier', 'Valentina',
    'Matías', 'Fernanda', 'Tomás', 'Daniela', 'Francisco', 'Josefa', 'Sebastián', 'Antonia', 'Cristóbal', 'Martina',
    'Vicente', 'Florencia', 'Gabriel', 'Isidora', 'Agustín', 'Catalina', 'Felipe', 'Emilia', 'Benjamín', 'Trinidad',
    'Maximiliano', 'Amanda', 'Ignacio', 'Jose', 'Renata', 'Simón', 'Paula', 'Lucas', 'Joaquín', 'Valeria',
    'Samuel', 'Constanza', 'Emilio', 'Josefina', 'Matilde', 'Gaspar', 'Tomás', 'Javiera', 'Agustina', 'Martín',
    'Lucía', 'Romina', 'Patricio', 'Álvaro', 'Esteban', 'Margarita', 'Camilo', 'Julieta', 'Rodrigo', 'Teresa',
    'Bastián', 'Noelia', 'Pablo', 'Tamara', 'Ignacia', 'Ezequiel', 'Nicolás', 'Catalina', 'Renato', 'Raúl',
    'Elisa', 'Kevin', 'Soledad', 'Valentín', 'Amparo', 'Benito', 'Guadalupe', 'Facundo', 'Millaray', 'Dante',
    'Josefina', 'Alan', 'Isidora', 'Julio', 'Ángela', 'Andrés', 'Amanda', 'Leandro', 'Daniela', 'Javiera',
    'Vicente', 'Gabriela', 'Alicia', 'Tomás', 'Martina', 'Agustina', 'Emilia', 'Benjamín', 'Florencia', 'Lucas'
]

apellidos = [
    'Pérez', 'Gómez', 'Soto', 'Ruiz', 'Torres', 'Muñoz', 'Silva', 'Rojas', 'Castro', 'Vera',
    'Navarro', 'Molina', 'Fuentes', 'Carrasco', 'Pizarro', 'Morales', 'Ortega', 'Reyes', 'Salazar', 'Campos',
    'Vargas', 'Leiva', 'Ahumada', 'Saavedra', 'Tapia', 'Escobar', 'Gallardo', 'Peña', 'Méndez', 'Riquelme',
    'Cáceres', 'Parra', 'Sanhueza', 'Henríquez', 'Valdés', 'Espinoza', 'Araya', 'Godoy', 'Lagos', 'Venegas',
    'Zúñiga', 'Cortés', 'Bustos', 'Mora', 'Salinas', 'Vergara', 'Guerrero', 'Navarrete', 'Figueroa', 'Paredes'
]

ruts_generados = set()
telefonos_generados = set()
datos = []

for i in range(100):
    nombre = nombres[i % len(nombres)]
    apellido = apellidos[i % len(apellidos)]

    # RUT único
    while True:
        rut = random.randint(7000000, 25000000)
        if rut not in ruts_generados:
            ruts_generados.add(rut)
            break

    # Teléfono chileno válido
    while True:
        telefono = f"9{random.randint(10000000, 99999999)}"
        if telefono not in telefonos_generados:
            telefonos_generados.add(telefono)
            break

    correo = f"{nombre.lower()}.{apellido.lower()}{i+1}@email.com"
    datos.append((rut, nombre, apellido, correo, telefono))

# Guardar en archivo CSV
with open("pasajeros_generados.csv", mode="w", newline="", encoding="utf-8") as archivo:
    escritor = csv.writer(archivo)
    escritor.writerow(["rut_pasajero", "nombre", "apellido", "correo", "telefono"])  # encabezado
    for fila in datos:
        escritor.writerow(fila)

print("Archivo 'pasajeros_generados.csv' creado con éxito.")