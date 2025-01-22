//
//  Untitled.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//


import SwiftData
import SwiftUI

@Observable
final class ListViewModel {
    
    /// Contexto de persistencia utilizado para realizar operaciones de base de datos.
    /// Este contexto es esencial para interactuar con el modelo de datos persistido.
    var modelContext: ModelContext? = nil
    
    /// Lista de tareas almacenadas en la memoria, representadas por el modelo `NoteModel`.
    /// Esta lista se actualiza cada vez que se realizan operaciones de CRUD sobre las tareas.
    var notes: [NoteModel] = []
    
    /// Inicializa una nueva instancia de `ListViewModel` con un array de notas opcional.
    /// - Parameter notes: Lista de tareas inicial a cargar en el ViewModel. Si no se proporciona, se inicializa una lista vacía.
    init(notes: [NoteModel] = []) {
        self.notes = notes
    }
    
    /// Carga las tareas desde la base de datos utilizando el contexto de persistencia.
    /// Actualiza la propiedad `notes` con los datos obtenidos o la establece como vacía si ocurre un error.
    func loadNotes() {
        do {
            let fetchDescription = FetchDescriptor<NoteModel>()
            let persistedNotes = try self.modelContext?.fetch(fetchDescription)
            self.notes = persistedNotes ?? []
        } catch {
            print("Error al cargar las notas: \(error)")
        }
    }
    
    /// Elimina una tarea específica del contexto de persistencia y guarda los cambios.
    /// - Parameters:
    ///   - task: La tarea a eliminar.
    ///   - context: El contexto de persistencia donde se realiza la eliminación.
    private func deleteTask(task: NoteModel, context: ModelContext) {
        // Elimina la tarea del contexto
        context.delete(task)
        
        // Guarda los cambios en la base de datos
        do {
            try context.save()
            print("Tarea eliminada con éxito.")
        } catch {
            print("Error al eliminar la tarea: \(error)")
        }
    }
    
    /// Elimina tareas desde los índices proporcionados en `offsets` y guarda los cambios en el contexto de persistencia.
    /// - Parameter offsets: Índices de las tareas a eliminar dentro del array `notes`.
    func delete(at offsets: IndexSet) {
        // Verifica si el índice está dentro de los límites del array `notes`
        for index in offsets {
            if index < notes.count {
                let task = notes[index]
                deleteTask(task: task, context: modelContext!)
            } else {
                print("Índice fuera de los límites: \(index)")
            }
        }
    }
    
    /// Mueve las tareas de un índice a otro en el array `notes`. Luego, actualiza el valor de `order` de cada tarea para reflejar el nuevo orden.
    /// - Parameters:
    ///   - from: Índices de las tareas a mover.
    ///   - to: Nuevo índice de destino al que se moverán las tareas.
    ///   - context: El contexto de persistencia donde se guardarán los cambios.
    func moveTask(from: IndexSet, to: Int, context: ModelContext) {
        print("Moviendo desde: \(from) hacia: \(to)")
        
        // Mueve las tareas dentro del array
        notes.move(fromOffsets: from, toOffset: to)
        
        // Actualiza el campo `order` de las tareas para reflejar el nuevo orden
        for (index, task) in notes.enumerated() {
            task.order = index
        }
        
        // Guarda los cambios en el contexto
        do {
            try context.save()
            print("Tareas reordenadas y guardadas.")
        } catch {
            print("Error al reordenar tareas: \(error)")
        }
    }
    
    /// Crea una nueva tarea con la descripción proporcionada, la agrega al contexto de persistencia y guarda los cambios.
    /// - Parameters:
    ///   - description: La descripción de la tarea que se va a crear.
    ///   - context: El contexto de persistencia donde se insertará la nueva tarea.
    func creationTask(description: String, context: ModelContext) {
        // Crea una nueva instancia de `NoteModel` con la descripción proporcionada
        let newTask = NoteModel(taskDescription: description, isComplete: false)
        
        // Añade la nueva tarea al contexto
        context.insert(newTask)
        
        // Guarda los cambios en el contexto
        do {
            try context.save()
            print("Tarea añadida con éxito.")
        } catch {
            print("Error al guardar la tarea: \(error)")
        }
    }
    
    /// Cambia el estado de completado de una tarea (marca como completada si no lo está, o como incompleta si está completa).
    /// Guarda los cambios realizados en la tarea.
    /// - Parameters:
    ///   - note: La tarea cuyo estado de completado se desea cambiar.
    ///   - context: El contexto de persistencia donde se guardará el cambio.
    func toggleCompletion(note: NoteModel, context: ModelContext) {
        // Alterna el estado de completado de la tarea
        note.isComplete.toggle()
        
        // Guarda los cambios en el contexto
        do {
            try context.save()
            print("Tarea actualizada con éxito.")
        } catch {
            print("Error al actualizar la tarea: \(error)")
        }
    }
}
