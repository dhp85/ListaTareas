//
//  Untitled.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

@Observable
final class ListViewModel{
    
    var notes: [NoteModel] = []
    
    init(notes: [NoteModel] = []) {
        self.notes = notes
    }
    
    func deleteTask(indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        print("Moviendo desde: \(from) hacia: \(to)")
        notes.move(fromOffsets: from, toOffset: to)
    }
    
    func addtask(task: String) {
        let newTask = NoteModel(description: task, isComplete: false)
        notes.append(newTask)
    }
    
    func toggleCompletion(note: NoteModel) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note.updateCompletion()
        }
    }
}
