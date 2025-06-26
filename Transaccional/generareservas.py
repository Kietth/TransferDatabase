import csv
import random
from datetime import datetime, timedelta
import calendar # Importar el módulo calendar

# --- Parámetros para la generación de datos ---
NUM_RESERVAS_POR_MES = 500
ANOS_A_GENERAR = 3
FECHA_INICIO_GENERACION = datetime(2023, 1, 1) # Fecha de inicio para las reservas
OUTPUT_CSV_FILENAME = "reservas_generadas.csv"
PASAJEROS_CSV_FILENAME = "pasajeros_generados.csv"

# --- Rango de IDs basados en DatosTransfer.sql (valores predefinidos) ---
# Estos valores se deben modificar si se ingresan más choferes, vehiculos y tipos de servicio
MIN_ID_CHOFER = 1
MAX_ID_CHOFER = 5  # Basado en los 5 choferes en DatosTransfer.sql
MIN_ID_VEHICULO = 1
MAX_ID_VEHICULO = 5 # Basado en los 5 vehículos en DatosTransfer.sql
MIN_ID_TIPO_SERVICIO = 1
MAX_ID_TIPO_SERVICIO = 4 # Basado en los 4 tipos_servicio en DatosTransfer.sql

# Rango de pasajeros por reserva
MIN_PASAJEROS = 1
MAX_PASAJEROS = 15

# Posibles estados de reserva
ESTADOS_RESERVA = ['Confirmada', 'Pendiente', 'Cancelada', 'Completada']

# Posibles métodos de pago
METODOS_PAGO = ['Tarjeta', 'Efectivo', 'Transferencia', 'PayPal']

# Rango de monto de pago
MIN_MONTO = 10000
MAX_MONTO = 60000 # Monto en pesos chilenos

# Posibles ubicaciones de origen/destino
LUGARES = [
    'Aeropuerto SCL', 'Terminal de Buses Valdivia', 'Centro de Valdivia',
    'Hotel Marina del Sol', 'Campus Isla Teja UACH', 'Campus Miraflores UACH',
    'Clinica Alemana Valdivia', 'Mall Plaza Los Rios', 'Puerto Fuy', 'Panguipulli',
    'Frutillar', 'Puerto Varas', 'Osorno', 'Temuco'
]

def load_ruts_from_csv(filename=PASAJEROS_CSV_FILENAME):
    """Carga los RUTs de pasajeros desde un archivo CSV."""
    ruts = []
    try:
        with open(filename, mode='r', newline='', encoding='utf-8') as file:
            reader = csv.reader(file)
            header = next(reader) # Saltar la cabecera
            rut_index = -1
            for i, col_name in enumerate(header):
                if 'rut' in col_name.lower(): # Buscar columna que contenga 'rut'
                    rut_index = i
                    break
            
            if rut_index == -1:
                print(f"Advertencia: No se encontró una columna 'rut' en '{filename}'. Asegúrate de que el CSV tenga una columna de RUTs.")
                return []

            for row in reader:
                try:
                    # Asumiendo que el RUT está limpio (sin guiones ni puntos)
                    rut_str = row[rut_index].replace('.', '').replace('-', '')
                    ruts.append(int(rut_str))
                except (ValueError, IndexError):
                    print(f"Advertencia: No se pudo procesar el RUT en la fila: {row}. Se omitirá.")
                    continue
        print(f"Cargados {len(ruts)} RUTs desde '{filename}'.")
        return ruts
    except FileNotFoundError:
        print(f"Error: El archivo '{filename}' no se encontró. Asegúrate de que esté en el mismo directorio que el script.")
        return []
    except Exception as e:
        print(f"Error al leer el archivo CSV '{filename}': {e}")
        return []

def generate_reservations_csv():
    """Genera reservas y las escribe en un archivo CSV."""
    ruts_pasajeros = load_ruts_from_csv()
    if not ruts_pasajeros:
        print("No se encontraron RUTs de pasajeros válidos. No se generarán reservas.")
        return

    all_reservations_data = []
    current_reserva_id = 0 # Inicia el ID de reserva en 0, el primero será 1

    # Cabeceras del CSV, coinciden con las columnas de hechos_reservas
    csv_headers = [
        'id_reserva', 'rut_pasajero', 'id_chofer', 'id_vehiculo', 'id_tipo_servicio',
        'cant_pasajeros', 'estado', 'fecha', 'hora', 'origen', 'destino', 'monto_pago', 'metodo_pago'
    ]
    all_reservations_data.append(csv_headers) # Añadir las cabeceras al inicio

    total_reservas_a_generar = NUM_RESERVAS_POR_MES * ANOS_A_GENERAR * 12
    print(f"Se generarán un total de {total_reservas_a_generar} reservas en '{OUTPUT_CSV_FILENAME}'.")

    for month_offset in range(ANOS_A_GENERAR * 12):
        # Calcula la fecha del primer día del mes actual para la generación
        current_month_date = FECHA_INICIO_GENERACION + timedelta(days=30 * month_offset)
        # Asegúrate de que current_month_date esté realmente en el mes correcto
        # Esto es más preciso:
        current_year = FECHA_INICIO_GENERACION.year + (FECHA_INICIO_GENERACION.month + month_offset - 1) // 12
        current_month = (FECHA_INICIO_GENERACION.month + month_offset - 1) % 12 + 1
        
        print(f"Generando {NUM_RESERVAS_POR_MES} reservas para el mes de {current_year}-{current_month:02d}...")

        for _ in range(NUM_RESERVAS_POR_MES):
            current_reserva_id += 1 # Incrementar el ID de reserva para cada nueva reserva
            
            rut_pasajero = random.choice(ruts_pasajeros)
            id_chofer = random.randint(MIN_ID_CHOFER, MAX_ID_CHOFER)
            id_vehiculo = random.randint(MIN_ID_VEHICULO, MAX_ID_VEHICULO)
            id_tipo_servicio = random.randint(MIN_ID_TIPO_SERVICIO, MAX_ID_TIPO_SERVICIO)
            
            cant_pasajeros = random.randint(MIN_PASAJEROS, MAX_PASAJEROS)
            estado = random.choice(ESTADOS_RESERVA)
            
            last_day_of_month = calendar.monthrange(current_year, current_month)[1]
            day = random.randint(1, last_day_of_month) 
            hour = random.randint(0, 23)
            minute = random.randint(0, 59)
            second = random.randint(0, 59)
            
            reservation_datetime = datetime(current_year, current_month, day, hour, minute, second)
            
            origen = random.choice(LUGARES)
            destino = random.choice([l for l in LUGARES if l != origen]) # Destino diferente al origen
            
            monto_pago = round(random.uniform(MIN_MONTO, MAX_MONTO), 2) # Redondear a 2 decimales
            metodo_pago = random.choice(METODOS_PAGO)

            reservation_data = [
                current_reserva_id,
                rut_pasajero,
                id_chofer,
                id_vehiculo,
                id_tipo_servicio,
                cant_pasajeros,
                estado,
                reservation_datetime.date().isoformat(), # Formato YYYY-MM-DD
                reservation_datetime.time().isoformat(), # Formato HH:MM:SS.microseconds
                origen,
                destino,
                monto_pago,
                metodo_pago
            ]
            all_reservations_data.append(reservation_data)
    
    try:
        with open(OUTPUT_CSV_FILENAME, mode='w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerows(all_reservations_data)
        print(f"\nGeneración de CSV finalizada. Se han escrito {len(all_reservations_data) - 1} reservas en '{OUTPUT_CSV_FILENAME}'.")
    except Exception as e:
        print(f"Error al escribir el archivo CSV: {e}")

if __name__ == "__main__":
    print("Iniciando la generación de datos de reserva en formato CSV...")
    generate_reservations_csv()
    print("Script terminado.")