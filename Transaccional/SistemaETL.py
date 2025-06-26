import psycopg2
from datetime import datetime, date

def get_db_connection_o(db_name):
    try:
        origen = psycopg2.connect(
            host="localhost",
            database=db_name,
            user="postgres",
            password="1234"
        )

        return origen
    except psycopg2.Error as e:
        print(f"Error al conectar a la base de datos {db_name}: {e}")
        return None
    
def get_db_connection_d(db_name):
    try:
        destino = psycopg2.connect(
            host="localhost",
            database=db_name,
            user="postgres",
            password="1234"
        )

        return destino
    except psycopg2.Error as e:
        print(f"Error al conectar a la base de datos {db_name}: {e}")
        return None

def load_dimensions():
    conn_transaccional = None
    conn_analitica = None
    try:
        conn_transaccional = get_db_connection_o("transfer_transaccional")
        conn_analitica = get_db_connection_d("transfer_analitica")

        if not conn_transaccional or not conn_analitica:
            print("No se pudieron establecer todas las conexiones necesarias para las dimensiones.")
            return

        cur_transaccional = conn_transaccional.cursor()
        cur_analitica = conn_analitica.cursor()

        print("\n--- Cargando Dimensiones ---")

        print("Cargando pasajeros...")

        cur_transaccional.execute("SELECT rut_pasajero, nombre, apellido FROM pasajeros ORDER BY rut_pasajero ASC;")
        pasajeros = cur_transaccional.fetchall()

        insert_update_pasajeros_query = """
            INSERT INTO dim_pasajeros (rut_pasajero, nombre, apellido)
            VALUES (%s, %s, %s)
            ON CONFLICT (rut_pasajero) DO UPDATE SET
                nombre = EXCLUDED.nombre,
                apellido = EXCLUDED.apellido;
        """
        cur_analitica.executemany(insert_update_pasajeros_query, pasajeros)
        conn_analitica.commit()
        print(f"Cargados/Actualizados {cur_analitica.rowcount} pasajeros en dim_pasajeros.")

        print("Dimensiones cargadas/actualizadas exitosamente.")

    except psycopg2.Error as e:
        print(f"Error de base de datos durante la carga de dimensiones: {e}")
        if conn_analitica:
            conn_analitica.rollback()
    except Exception as e:
        print(f"Ocurrió un error inesperado durante la carga de dimensiones: {e}")
        if conn_analitica:
            conn_analitica.rollback()
    finally:
        if conn_transaccional:
            cur_transaccional.close()
            conn_transaccional.close()
        if conn_analitica:
            cur_analitica.close()
            conn_analitica.close()
            print("Conexiones de base de datos para dimensiones cerradas.")


def load_facts():
    conn_analitica = None 
    conn_transaccional = None 
    try:
        conn_transaccional = get_db_connection_o("transfer_transaccional") 
        conn_analitica = get_db_connection_d("transfer_analitica") 

        if not conn_transaccional or not conn_analitica:
            print("No se pudieron establecer todas las conexiones necesarias para los hechos.")
            return

        cur_transaccional = conn_transaccional.cursor()
        cur_analitica = conn_analitica.cursor()

        print("\n--- Cargando Hechos Reservas ---")
        
        cur_analitica.execute("SELECT ultima_fecha_carga FROM etl_control WHERE nombre_proceso = 'reservas_etl'")
        last_load_date_row = cur_analitica.fetchone()
        
        last_load_date = last_load_date_row[0] if last_load_date_row and last_load_date_row[0] else date(1900, 1, 1)
        
        print(f"Última fecha de carga registrada para hechos: {last_load_date}")
        
        cur_transaccional.execute(f"""
            SELECT
                id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio,
                cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago
            FROM hechos_reservas
            WHERE fecha >= %s
            ORDER BY fecha ASC, id_reserva ASC;
        """, (last_load_date,))
        
        new_reservations = cur_transaccional.fetchall()
        print(f"Encontradas {len(new_reservations)} nuevas reservas para cargar.")

        if not new_reservations:
            print("No hay nuevas reservas de hechos para procesar. Carga de hechos completada.")
            return

        insert_query = """
            INSERT INTO hechos_reservas_analisis (
                id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio,
                cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (id_reserva) DO NOTHING;
        """
        
        data_to_insert = [row for row in new_reservations]

        cur_analitica.executemany(insert_query, data_to_insert)
        conn_analitica.commit()
        print(f"Cargadas {cur_analitica.rowcount} nuevas reservas en hechos_reservas_analisis.")

        new_last_load_date = datetime.now().date()
        cur_analitica.execute("""
            UPDATE etl_control
            SET ultima_fecha_carga = %s
            WHERE nombre_proceso = 'reservas_etl';
        """, (new_last_load_date,))
        conn_analitica.commit()
        print(f"Fecha de última carga de hechos actualizada a: {new_last_load_date}")
        
    except psycopg2.Error as e:
        print(f"Error de base de datos durante la carga de hechos: {e}")
        if conn_analitica:
            conn_analitica.rollback()
    except Exception as e:
        print(f"Ocurrió un error inesperado durante la carga de hechos: {e}")
        if conn_analitica:
            conn_analitica.rollback()
    finally:
        if conn_transaccional:
            cur_transaccional.close()
            conn_transaccional.close()
        if conn_analitica:
            cur_analitica.close()
            conn_analitica.close()
            print("Conexiones de base de datos para hechos cerradas.")

if __name__ == "__main__":
    print("Iniciando proceso ETL completo...")

    load_dimensions()

    load_facts()
    
    print("\nProceso ETL completo finalizado.")