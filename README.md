# Aplicación de Lista de Tareas

Este es un proyecto de una pequeña aplicación de tareas, en la que puedes agregar, marcar como realizada o no realizada, 
eliminar o mover las tareas en la lista. Utiliza la arquitectura MVVM, SwiftUI para la interfaz de usuario y SwiftData para la persistencia de datos.

## Funcionalidades

La aplicación tiene dos vistas principales:

1. **Vista de Lista de Tareas**: 
   - Muestra una lista de tareas.
   - Permite marcar una tarea como "realizada" o "no realizada".
   - Permite eliminar tareas de la lista.
   - Permite mover tareas dentro de la lista utilizando el índice (ordenarlas).

2. **Vista de Añadir Tarea**:
   - Permite al usuario escribir una nueva tarea.
   - Añadirla a la lista de tareas.

## Características Técnicas

- **MVVM (Modelo-Vista-Modelo de Vista)**: La arquitectura utilizada para separar la lógica de negocio de la interfaz de usuario.
- **SwiftUI**: Utilizado para construir la interfaz de usuario de manera declarativa.
- **SwiftData**: Utilizado para la persistencia de datos y almacenamiento de las tareas, garantizando que los datos persistan entre las ejecuciones de la aplicación.

## Estructura del Proyecto

### 1. **Modelo (`NoteModel`)**

El modelo de datos que representa una tarea. Se define con propiedades como:

- `id`: Un identificador único para cada tarea.
- `taskDescription`: El texto que describe la tarea.
- `isComplete`: Un booleano que indica si la tarea está marcada como completada.
- `order`: El índice que representa el orden de la tarea en la lista.

### 2. **Vista del Modelo de Vista (`ListViewModel`)**

El `ListViewModel` gestiona las tareas y las operaciones sobre ellas, como cargar, agregar, eliminar, mover y marcar como completada. 
Se utiliza para conectar la vista con los datos y la lógica de negocio.

### 3. **Vistas**

- **Lista de Tareas (`ListView`)**: Muestra la lista de tareas con sus detalles y permite interactuar con ellas.
- **Añadir Tarea (`AddView`)**: Una vista que permite al usuario escribir y agregar nuevas tareas a la lista.

## Requisitos

- Xcode 15 o superior.
- macOS 12.0 o superior.
- Familiaridad con SwiftUI y MVVM.

## Instalación

Para clonar el proyecto y ejecutarlo en tu máquina local, sigue estos pasos:

1. Clona este repositorio a tu máquina local:
   ```bash
   git clone https://github.com/dhp85/ListaTareas.git

   	2.	Abre el archivo ListaTareas.xcodeproj en Xcode.
	3.	Asegúrate de seleccionar el simulador o dispositivo correcto.
	4.	Compila y ejecuta el proyecto: Cmd + R
## Creditos
Desarrollado por Diego Herreros Parrón practicar la creación de interface con SwiftUI y la persistencia de datos con SwiftData.
