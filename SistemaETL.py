import psycopg2
from datetime import datetime, date

def run_etl():
    conn = None
    try:
        # Conexión a la base de datos
        conn = psycopg2.connect(
            host="localhost",
            port="5432",
            database="Transfer",
            user="postgres", # Cambiar por el dato correspondiente
            password="1234"  # Cambiar por el dato correspondiente
        )
        cur = conn.cursor()

        print("Conexión exitosa a la base de datos para ETL.")
        
        cur.execute("SELECT ultima_fecha_carga FROM etl_control WHERE nombre_proceso = 'reservas_etl'")
        last_load_date_row = cur.fetchone()
        
        last_load_date = last_load_date_row[0] if last_load_date_row and last_load_date_row[0] else date(1900, 1, 1)
        
        print(f"Última fecha de carga registrada: {last_load_date}")
        
        cur.execute(f"""
            SELECT
                id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio,
                cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago
            FROM hechos_reservas
            WHERE fecha >= %s
            ORDER BY fecha ASC, id_reserva ASC;
        """, (last_load_date,))
        
        new_reservations = cur.fetchall()
        print(f"Encontradas {len(new_reservations)} nuevas reservas para cargar.")

        if not new_reservations:
            print("No hay nuevas reservas para procesar. ETL completado.")
            return

        insert_query = """
            INSERT INTO hechos_reservas_analisis (
                id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio,
                cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (id_reserva) DO NOTHING; -- Ignora si la reserva ya existe (idempotencia)
        """
        
        data_to_insert = [row for row in new_reservations]
        
        cur.executemany(insert_query, data_to_insert)
        conn.commit()
        print(f"Cargadas {cur.rowcount} nuevas reservas en hechos_reservas_analisis.")

        new_last_load_date = datetime.now().date()
        cur.execute("""
            UPDATE etl_control
            SET ultima_fecha_carga = %s
            WHERE nombre_proceso = 'reservas_etl';
        """, (new_last_load_date,))
        conn.commit()
        print(f"Fecha de última carga actualizada a: {new_last_load_date}")
        
    except psycopg2.Error as e:
        print(f"Error de base de datos durante el ETL: {e}")
        if conn:
            conn.rollback()
    except Exception as e:
        print(f"Ocurrió un error inesperado durante el ETL: {e}")
        if conn:
            conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()
            print("Conexión a la base de datos cerrada.")

if __name__ == "__main__":
    print("Iniciando proceso ETL para Hechos de Reservas...")
    run_etl()
    print("Proceso ETL finalizado.")