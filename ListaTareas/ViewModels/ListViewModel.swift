//
//  Untitled.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

@Observable
final class ListViewModel{
    
    var note: [NoteModel] = []
    
    func saveNote(description: String) {
        let newNote = NoteModel(description: description)
        note.insert(newNote, at: 0)
    }
}
