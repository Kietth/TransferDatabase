import psycopg2
import argparse
import matplotlib.pyplot as plt
import re
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument("anio", type=int)
args = parser.parse_args()

try:
    # Conexion a base de datos
    conexion = psycopg2.connect(
        host="localhost",        
        port="5432",             
        database="Transfer",  
        user="postgres", # Modificar por el usuario correspondiente      
        password="1234" # Modificar por la contraseña del usuario correspondiente
    )
    print("Conexión exitosa a PostgreSQL")

    cursor = conexion.cursor()

    # Definicion de consultas SQL
    consultas = [
        {
            "titulo": "Ingresos generados por cada chofer",
            "sql": """
                SELECT 
                    C.nombre || ' ' || C.apellido AS chofer,
                    SUM(H.monto_pago) AS total_generado
                FROM hechos_reservas_analisis H
                JOIN choferes C ON H.id_chofer = C.id_chofer
                WHERE 
                    EXTRACT(YEAR FROM H.fecha) = %s AND
                    H.estado = 'Completada'
                GROUP BY C.id_chofer, C.nombre, C.apellido
                ORDER BY total_generado DESC;
            """    
        },
        {
            "titulo": "Ganancias totales de cada mes",
            "sql": """
                	SELECT 
                        TO_CHAR(fecha, 'Month') AS mes,
                        EXTRACT(MONTH FROM fecha) AS numero_mes,
                        SUM(monto_pago) AS total_mes
                    FROM hechos_reservas_analisis
                    WHERE 
                        EXTRACT(YEAR FROM fecha) = %s AND
                        estado = 'Completada'
                    GROUP BY mes, numero_mes
                    ORDER BY numero_mes;
            """
        },
        {
            "titulo": "Ganancias totales de cada chofer por mes",
            "sql": """
                SELECT 
                    C.nombre  || ' ' ||  C.apellido AS chofer,
                    EXTRACT(MONTH FROM H.fecha) AS mes,
                    SUM(H.monto_pago) AS total_mes
                FROM hechos_reservas_analisis H
                JOIN choferes C ON H.id_chofer = C.id_chofer
                WHERE 
                    EXTRACT(YEAR FROM H.fecha) = %s AND
                    H.estado = 'Completada'
                GROUP BY C.id_chofer, C.nombre, C.apellido, mes
                ORDER BY chofer, mes;
            """
        },
        {
            "titulo": "Tipos de servicios solicitados por mes",
            "sql": """
                SELECT 
                    TS.nombre AS tipo_servicio,
                    EXTRACT(MONTH FROM HR.fecha) AS mes,
                    COUNT(*) AS cantidad_servicios
                FROM hechos_reservas_analisis HR
                JOIN tipos_servicio TS ON HR.id_tipo_servicio = TS.id_tipo_servicio
                WHERE 
                    EXTRACT(YEAR FROM HR.fecha) = %s AND
                    HR.estado = 'Completada'
                GROUP BY TS.nombre, mes
                ORDER BY mes, TS.nombre;
            """
        },
        {
            "titulo": "Vehiculos usados por mes",
            "sql": """
                SELECT 
                    V.patente AS id_vehiculo, -- Ahora se selecciona la patente
                    EXTRACT(MONTH FROM H.fecha) AS mes,
                    COUNT(*) AS veces_usado
                FROM hechos_reservas_analisis H
                JOIN vehiculos V ON H.id_vehiculo = V.id_vehiculo
                WHERE 
                    EXTRACT(YEAR FROM H.fecha) = %s AND
                    H.estado = 'Completada'
                GROUP BY V.patente, mes
                ORDER BY mes, V.patente;
            """
        },
        {
            "titulo": "Total generado por vehiculo en un año",
            "sql": """
                SELECT 
                    V.patente AS id_vehiculo, -- Ahora se selecciona la patente
                    SUM(H.monto_pago) AS total_generado
                FROM hechos_reservas_analisis H
                JOIN vehiculos V ON H.id_vehiculo = V.id_vehiculo
                WHERE 
                    EXTRACT(YEAR FROM H.fecha) = %s AND
                    H.estado = 'Completada'
                GROUP BY V.patente
                ORDER BY total_generado DESC;
            """
        }
    
    
    ]

    # Funcion para crear los graficos de linea
    def graficar_linea_mensual(resultados, columnas, titulo, anio):
        
        if not resultados:
            print(f"No hay resultados para {titulo}")
            return

        # Funcion para convertir resultados en DataFrame
        df = pd.DataFrame(resultados, columns=columnas)
        df['mes'] = pd.to_numeric(df['mes'])
        df['valor']=pd.to_numeric(df['valor'])
        
        # Pivotear: meses como índice, categorías como columnas
        df_pivot = df.pivot(index='mes', columns='categoria', values='valor').fillna(0)

        # Funcion de creación de gráficos
        plt.figure(figsize=(12, 6))
        df_pivot.plot(ax=plt.gca(), marker='o')

        plt.title(f"{titulo} ({anio})")
        plt.xlabel("Mes")
        plt.ylabel("Valor")
        plt.xticks(range(1, 13))
        plt.grid(True)
        plt.legend(title="Categoría", bbox_to_anchor=(1.05, 1), loc='upper left')
        plt.tight_layout(rect=[0, 0, 0.8, 1])

        # Funcion para guardar imagenes
        titulolimpio = re.sub(r'\s+', '', titulo).replace('ñ', 'n')
        nombre_archivo = f"{titulolimpio}{anio}.png"
        plt.savefig(nombre_archivo)
        print(f"Gráfico guardado como {nombre_archivo}")
        plt.close()
    
    # Analiza las consultas y crea los graficos de linea llamando a la funcion y dos graficos de torta 
    for consulta in consultas:
        cursor.execute(consulta["sql"], (args.anio,))
        resultados = cursor.fetchall()

        if resultados:
            if consulta["titulo"] == "Ganancias totales de cada mes":
                resultados_transformados = [("Total", fila[1], fila[2]) for fila in resultados]
                graficar_linea_mensual(resultados_transformados, ["categoria", "mes", "valor"], consulta["titulo"], args.anio)

            elif consulta["titulo"] == "Ganancias totales de cada chofer por mes":
                graficar_linea_mensual(resultados, ["categoria", "mes", "valor"], consulta["titulo"], args.anio)

            elif consulta["titulo"] == "Tipos de servicios solicitados por mes":
                graficar_linea_mensual(resultados, ["categoria", "mes", "valor"], consulta["titulo"], args.anio)

            elif consulta["titulo"] == "Vehiculos usados por mes":
                graficar_linea_mensual(resultados, ["categoria", "mes", "valor"], consulta["titulo"], args.anio)

            elif consulta["titulo"] == "Total generado por vehiculo en un año":
                # Se utiliza la patente para la etiqueta del gráfico
                ids = [f"Vehículo {fila[0]}" for fila in resultados] 
                montos = [fila[1] for fila in resultados]

                fig, ax = plt.subplots(figsize=(10, 8))
                wedges, texts, autotexts = ax.pie(
                    montos,
                    labels=None, # No mostrar etiquetas directamente en las porciones
                    autopct='%1.1f%%',
                    startangle=140,
                    textprops={'fontsize': 10}
                )
                # Crear etiquetas personalizadas para la leyenda
                etiquetas = [f"{vid} (${m:,.0f})" for vid, m in zip(ids, montos)]
                ax.legend(wedges, etiquetas, title="Vehículos", loc="center left", bbox_to_anchor=(0.9, 0.5), fontsize=10, title_fontsize=11)
                ax.set_title(f"{consulta['titulo']} ({args.anio})", fontsize=14)
                plt.tight_layout(rect=[0, 0, 0.75, 1])
                titulolimpio = re.sub(r'\s+', '', consulta['titulo']).replace('ñ', 'n')
                nombre_archivo = f"{titulolimpio}{args.anio}.png"
                plt.savefig(nombre_archivo)
                print(f"Gráfico guardado como {nombre_archivo}")
                plt.close()

            elif consulta["titulo"] == "Ingresos generados por cada chofer":
                nombres = [fila[0] for fila in resultados]
                montos = [fila[1] for fila in resultados]

                fig, ax = plt.subplots(figsize=(10, 8))
                wedges, texts, autotexts = ax.pie(
                    montos,
                    labels=None, # No mostrar etiquetas directamente en las porciones
                    autopct='%1.1f%%',
                    startangle=140,
                    textprops={'fontsize': 10}
                )
                # Crear etiquetas personalizadas para la leyenda
                etiquetas = [f"{n} (${m:,.0f})" for n, m in zip(nombres, montos)]
                ax.legend(wedges, etiquetas, title="Choferes", loc="center left", bbox_to_anchor=(0.9, 0.5), fontsize=10, title_fontsize=11)
                ax.set_title(f"{consulta['titulo']} ({args.anio})")
                plt.tight_layout(rect=[0, 0, 0.75, 1])
                titulolimpio = re.sub(r'\s+', '', consulta['titulo']).replace('ñ', 'n')
                nombre_archivo = f"{titulolimpio}{args.anio}.png"
                plt.savefig(nombre_archivo)
                print(f"Gráfico guardado como {nombre_archivo}")
                plt.close()

        else:
            print(f"No hay resultados para: {consulta['titulo']}")


except Exception as error:
    print("Error al conectar a PostgreSQL:", error)

# Finaliza la conexion con la base de datos
finally:
    if conexion:
        cursor.close()
        conexion.close()
        print("Conexión cerrada.")
