//
//  Untitled.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

@Observable
final class ListViewModel{
    
    var note: [NoteModel] = [NoteModel(description: "Ir a por el coche", isComplete: true),
                             NoteModel(description: "Pagar comunidad", isComplete: false),
                             NoteModel(description: "Hacer la compra", isComplete: false)]
    
    init() {
        
    }
    
    func saveNote(description: String) {
       
    }
    
    func deleteTask(indexSet: IndexSet) {
        note.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        print("Moviendo desde: \(from) hacia: \(to)")
        note.move(fromOffsets: from, toOffset: to)
    }
    
    func addtask(task: String) {
        let newTask = NoteModel(description: task, isComplete: false)
        note.append(newTask)
    }
}
