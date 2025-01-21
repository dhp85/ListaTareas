//
//  IntroPageItem.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

struct NoteModel: Identifiable {
    let id: UUID
    let description: String
    let isComplete: Bool

    init(id: UUID = UUID(), description: String, isComplete: Bool) {
        self.id = id
        self.description = description
        self.isComplete = isComplete
    }
}

