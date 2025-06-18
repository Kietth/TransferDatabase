import psycopg2
import tkinter as tk
from tkinter import messagebox, simpledialog, filedialog
import csv
import os

try:
    # Conexion a base de datos
    conexion = psycopg2.connect(
        host="localhost",
        port="5432",
        database="Transfer",
        user="postgres",  # Modificar por el usuario correspondiente
        password="1234"   # Modificar por la contraseña del usuario correspondiente
    )
    print("Conexión exitosa a PostgreSQL")
    cursor = conexion.cursor()
except Exception as error:
    print("Error al conectar a PostgreSQL:", error)

def ingresar_reserva():
    def guardar():
        try:
            cursor.execute(
                "INSERT INTO hechos_reservas (id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio, cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                (
                    int(e_id.get()), int(e_rut.get()), int(e_chofer.get()), int(e_vehiculo.get()), int(e_tipo.get()),
                    int(e_cant.get()), e_estado.get(), e_fecha.get(), e_hora.get(), e_origen.get(), e_destino.get(),
                    float(e_monto.get()), e_metodo.get()
                )
            )
            conexion.commit()
            messagebox.showinfo("Éxito", "Reserva ingresada correctamente.")
            ventana_ingreso.destroy()
        except Exception as e:
            conexion.rollback()
            messagebox.showerror("Error", f"No se pudo ingresar la reserva:\n{e}")

    ventana_ingreso = tk.Toplevel(ventana)
    ventana_ingreso.title("Ingresar Reserva")

    labels = [
        "ID Reserva", "RUT Pasajero", "ID Chofer", "ID Vehículo", "ID Tipo Servicio",
        "Cantidad Pasajeros", "Estado", "Fecha (YYYY-MM-DD)", "Hora (HH:MM:SS)",
        "Origen", "Destino", "Monto Pago", "Método Pago"
    ]
    entries = []
    for i, label in enumerate(labels):
        tk.Label(ventana_ingreso, text=label).grid(row=i, column=0, sticky="e")
        entry = tk.Entry(ventana_ingreso)
        entry.grid(row=i, column=1)
        entries.append(entry)

    (e_id, e_rut, e_chofer, e_vehiculo, e_tipo, e_cant, e_estado, e_fecha, e_hora,
     e_origen, e_destino, e_monto, e_metodo) = entries

    tk.Button(ventana_ingreso, text="Guardar", command=guardar).grid(row=len(labels), column=0, columnspan=2, pady=10)

def modificar_reserva():
    id_reserva = simpledialog.askinteger("Modificar", "Ingrese el ID de la reserva a modificar:")
    if not id_reserva:
        return
    try:
        cursor.execute("SELECT * FROM hechos_reservas WHERE id_reserva=%s", (id_reserva,))
        reserva = cursor.fetchone()
        if not reserva:
            messagebox.showerror("Error", "Reserva no encontrada.")
            return
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudo buscar la reserva:\n{e}")
        return

    def guardar():
        try:
            cursor.execute(
                "UPDATE hechos_reservas SET rut_pasajero=%s, id_chofer=%s, id_vehiculo=%s, id_tipo_servicio=%s, cant_pasajeros=%s, estado=%s, fecha=%s, hora=%s, origen=%s, destino=%s, monto_pago=%s, metodo_pago=%s WHERE id_reserva=%s",
                (
                    int(e_rut.get()), int(e_chofer.get()), int(e_vehiculo.get()), int(e_tipo.get()),
                    int(e_cant.get()), e_estado.get(), e_fecha.get(), e_hora.get(), e_origen.get(), e_destino.get(),
                    float(e_monto.get()), e_metodo.get(), id_reserva
                )
            )
            conexion.commit()
            messagebox.showinfo("Éxito", "Reserva modificada correctamente.")
            ventana_modificar.destroy()
        except Exception as e:
            conexion.rollback()
            messagebox.showerror("Error", f"No se pudo modificar la reserva:\n{e}")

    ventana_modificar = tk.Toplevel(ventana)
    ventana_modificar.title("Modificar Reserva")

    labels = [
        "RUT Pasajero", "ID Chofer", "ID Vehículo", "ID Tipo Servicio",
        "Cantidad Pasajeros", "Estado", "Fecha (YYYY-MM-DD)", "Hora (HH:MM:SS)",
        "Origen", "Destino", "Monto Pago", "Método Pago"
    ]
    values = reserva[1:]  # omite id_reserva
    entries = []
    for i, (label, value) in enumerate(zip(labels, values)):
        tk.Label(ventana_modificar, text=label).grid(row=i, column=0, sticky="e")
        entry = tk.Entry(ventana_modificar)
        entry.insert(0, str(value))
        entry.grid(row=i, column=1)
        entries.append(entry)

    (e_rut, e_chofer, e_vehiculo, e_tipo, e_cant, e_estado, e_fecha, e_hora,
     e_origen, e_destino, e_monto, e_metodo) = entries

    tk.Button(ventana_modificar, text="Guardar", command=guardar).grid(row=len(labels), column=0, columnspan=2, pady=10)

def listar_reservas():
    try:
        cursor.execute("SELECT * FROM hechos_reservas")
        reservas = cursor.fetchall()

        ventana_lista = tk.Toplevel(ventana)
        ventana_lista.title("Lista de Reservas")

        # Crear un Frame para contener el Text y el Scrollbar
        frame = tk.Frame(ventana_lista)
        frame.pack(fill="both", expand=True)
        scrollbar = tk.Scrollbar(frame)
        scrollbar.pack(side="right", fill="y")

        # Crear el widget Text y vincularlo al scrollbar
        text = tk.Text(frame, width=150, height=50, yscrollcommand=scrollbar.set)
        text.pack(side="left", fill="both", expand=True)
        scrollbar.config(command=text.yview)

        encabezado = ("ID", "RUT Pasajero", "ID Chofer", "ID Vehículo", "ID Tipo Servicio",
                      "Cant. Pasajeros", "Estado", "Fecha", "Hora", "Origen", "Destino", "Monto Pago", "Método Pago")
        text.insert("end", "\t".join(encabezado) + "\n")
        text.insert("end", "-" * 180 + "\n")

        for r in reservas:
            text.insert("end", "\t".join([str(x) for x in r]) + "\n")
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo listar las reservas:\n{e}")

def eliminar_reserva():
    id_reserva = simpledialog.askinteger("Eliminar", "Ingrese el ID de la reserva a eliminar:")
    if not id_reserva:
        return
    try:
        cursor.execute("DELETE FROM hechos_reservas WHERE id_reserva=%s", (id_reserva,))
        conexion.commit()
        if cursor.rowcount == 0:
            messagebox.showinfo("Eliminar", "No se encontró la reserva.")
        else:
            messagebox.showinfo("Eliminar", "Reserva eliminada correctamente.")
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudo eliminar la reserva:\n{e}")


def cargar_datos_prueba():
    try:
        ruts_disponibles = []

        ruta_base = os.path.dirname(os.path.abspath(__file__))
        archivo_pasajeros = os.path.join(ruta_base, "pasajeros_generados.csv")
        archivo_reservas = os.path.join(ruta_base, "reservas_generadas.csv")

        # Cargar pasajeros desde archivo
        with open(archivo_pasajeros, newline='', encoding='utf-8') as csvfile:
            lector = csv.DictReader(csvfile)
            for fila in lector:
                rut = int(fila["rut_pasajero"])
                ruts_disponibles.append(rut)
                cursor.execute(
                    "INSERT INTO pasajeros (rut_pasajero, nombre, apellido, correo, telefono) VALUES (%s, %s, %s, %s, %s)",
                    (rut, fila["nombre"], fila["apellido"], fila["correo"], fila["telefono"])
                )

        ids_reservas = []

        # Cargar reservas desde archivo
        with open(archivo_reservas, newline='', encoding='utf-8') as csvfile:
            lector = csv.DictReader(csvfile)
            for fila in lector:
                id_reserva = int(fila["id_reserva"])
                ids_reservas.append(id_reserva)
                cursor.execute(
                    "INSERT INTO hechos_reservas (id_reserva, rut_pasajero, id_chofer, id_vehiculo, id_tipo_servicio, cant_pasajeros, estado, fecha, hora, origen, destino, monto_pago, metodo_pago) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (id_reserva, fila["rut_pasajero"], fila["id_chofer"], fila["id_vehiculo"], fila["id_tipo_servicio"], fila["cant_pasajeros"], fila["estado"], fila["fecha"], fila["hora"], fila["origen"], fila["destino"], fila["monto_pago"], fila["metodo_pago"])
                )

        conexion.commit()
        messagebox.showinfo("Éxito", "Pasajeros y reservas cargados correctamente desde archivos locales.")
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudieron cargar los datos:\n{e}")

def salir():
    ventana.destroy()
    cursor.close()
    conexion.close()

def ingresar_pasajero():
    def guardar():
        try:
            cursor.execute(
                "INSERT INTO pasajeros (rut_pasajero, nombre, apellido, correo, telefono) VALUES (%s, %s, %s, %s, %s)",
                (int(e_rut.get()), e_nombre.get(), e_apellido.get(), e_correo.get(), e_telefono.get())
            )
            conexion.commit()
            messagebox.showinfo("Éxito", "Pasajero ingresado correctamente.")
            ventana_ingreso.destroy()
        except Exception as e:
            conexion.rollback()
            messagebox.showerror("Error", f"No se pudo ingresar el pasajero:\n{e}")

    ventana_ingreso = tk.Toplevel(ventana)
    ventana_ingreso.title("Ingresar Pasajero")

    labels = ["RUT Pasajero", "Nombre", "Apellido", "Correo", "Teléfono"]
    entries = []
    for i, label in enumerate(labels):
        tk.Label(ventana_ingreso, text=label).grid(row=i, column=0, sticky="e")
        entry = tk.Entry(ventana_ingreso)
        entry.grid(row=i, column=1)
        entries.append(entry)

    e_rut, e_nombre, e_apellido, e_correo, e_telefono = entries

    tk.Button(ventana_ingreso, text="Guardar", command=guardar).grid(row=len(labels), column=0, columnspan=2, pady=10)

def modificar_pasajero():
    rut_pasajero = simpledialog.askinteger("Modificar", "Ingrese el RUT del pasajero a modificar:")
    if not rut_pasajero:
        return
    try:
        cursor.execute("SELECT * FROM pasajeros WHERE rut_pasajero=%s", (rut_pasajero,))
        pasajero = cursor.fetchone()
        if not pasajero:
            messagebox.showerror("Error", "Pasajero no encontrado.")
            return
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudo buscar el pasajero:\n{e}")
        return

    def guardar():
        try:
            cursor.execute(
                "UPDATE pasajeros SET nombre=%s, apellido=%s, correo=%s, telefono=%s WHERE rut_pasajero=%s",
                (e_nombre.get(), e_apellido.get(), e_correo.get(), e_telefono.get(), rut_pasajero)
            )
            conexion.commit()
            messagebox.showinfo("Éxito", "Pasajero modificado correctamente.")
            ventana_modificar.destroy()
        except Exception as e:
            conexion.rollback()
            messagebox.showerror("Error", f"No se pudo modificar el pasajero:\n{e}")

    ventana_modificar = tk.Toplevel(ventana)
    ventana_modificar.title("Modificar Pasajero")

    labels = ["Nombre", "Apellido", "Correo", "Teléfono"]
    values = pasajero[1:]
    entries = []
    for i, (label, value) in enumerate(zip(labels, values)):
        tk.Label(ventana_modificar, text=label).grid(row=i, column=0, sticky="e")
        entry = tk.Entry(ventana_modificar)
        entry.insert(0, str(value))
        entry.grid(row=i, column=1)
        entries.append(entry)

    e_nombre, e_apellido, e_correo, e_telefono = entries

    tk.Button(ventana_modificar, text="Guardar", command=guardar).grid(row=len(labels), column=0, columnspan=2, pady=10)

def listar_pasajeros():
    try:
        cursor.execute("SELECT * FROM pasajeros")
        pasajeros = cursor.fetchall()
        ventana_lista = tk.Toplevel(ventana)
        ventana_lista.title("Lista de Pasajeros")
        text = tk.Text(ventana_lista, width=80, height=15)
        text.pack()
        encabezado = ("RUT", "Nombre", "Apellido", "Correo", "Teléfono")
        text.insert("end", "\t".join(encabezado) + "\n")
        text.insert("end", "-" * 80 + "\n")
        for p in pasajeros:
            text.insert("end", "\t".join([str(x) for x in p]) + "\n")
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo listar los pasajeros:\n{e}")

def eliminar_pasajero():
    rut_pasajero = simpledialog.askinteger("Eliminar", "Ingrese el RUT del pasajero a eliminar:")
    if not rut_pasajero:
        return
    try:
        cursor.execute("DELETE FROM pasajeros WHERE rut_pasajero=%s", (rut_pasajero,))
        conexion.commit()
        if cursor.rowcount == 0:
            messagebox.showinfo("Eliminar", "No se encontró el pasajero.")
        else:
            messagebox.showinfo("Eliminar", "Pasajero eliminado correctamente.")
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudo eliminar el pasajero:\n{e}")

def borrar_datos_prueba():
    confirmacion = messagebox.askyesno(
        "Confirmación",
        "¿Estás seguro de que quieres eliminar TODOS los datos de pasajeros y reservas?\nEsta acción no se puede deshacer."
    )
    if not confirmacion:
        return
    try:
        # Borra primero las reservas (por clave foránea), luego los pasajeros
        cursor.execute("DELETE FROM hechos_reservas")
        cursor.execute("DELETE FROM pasajeros")
        conexion.commit()
        messagebox.showinfo("Éxito", "Datos de prueba borrados correctamente.")
    except Exception as e:
        conexion.rollback()
        messagebox.showerror("Error", f"No se pudieron borrar los datos:\n{e}")

# Interfaz principal

ventana = tk.Tk()
ventana.title("Gestión de Reservas")
ventana.geometry("300x600")

tk.Label(ventana, text="Menú Principal", font=("Arial", 14)).pack(pady=10)

tk.Label(ventana, text="Gestión de Reservas", font=("Arial", 12)).pack(pady=5)
tk.Button(ventana, text="Ingresar Reserva", command=ingresar_reserva).pack(fill="x", padx=20, pady=5)
tk.Button(ventana, text="Modificar Reserva", command=modificar_reserva).pack(fill="x", padx=20, pady=5)
tk.Button(ventana, text="Listar Reservas", command=listar_reservas).pack(fill="x", padx=20, pady=5)
tk.Button(ventana, text="Eliminar Reserva", command=eliminar_reserva).pack(fill="x", padx=20, pady=5)

tk.Label(ventana, text="Gestión de Pasajeros", font=("Arial", 12)).pack(pady=5)
tk.Button(ventana, text="Ingresar Pasajero", command=ingresar_pasajero).pack(fill="x", padx=20, pady=2)
tk.Button(ventana, text="Modificar Pasajero", command=modificar_pasajero).pack(fill="x", padx=20, pady=2)
tk.Button(ventana, text="Listar Pasajeros", command=listar_pasajeros).pack(fill="x", padx=20, pady=2)
tk.Button(ventana, text="Eliminar Pasajero", command=eliminar_pasajero).pack(fill="x", padx=20, pady=2)

tk.Label(ventana, text="Datos de Prueba", font=("Arial", 12)).pack(pady=5)
tk.Button(ventana, text="Cargar Datos de Prueba", command=cargar_datos_prueba).pack(fill="x", padx=20, pady=5)
tk.Button(ventana, text="Borrar TODOS los datos", command=borrar_datos_prueba).pack(fill="x", padx=20, pady=5)

tk.Button(ventana, text="Salir", command=salir).pack(fill="x", padx=20, pady=20)

ventana.mainloop()

