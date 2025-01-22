//
//  IntroPageItem.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation
import SwiftData

@Model
class NoteModel: Identifiable {
    var id: String
    var taskDescription: String
    var isComplete: Bool
    var order: Int

    init(id: String = UUID().uuidString, taskDescription: String, isComplete: Bool, order: Int = 0) {
        self.id = id
        self.taskDescription = taskDescription
        self.isComplete = isComplete
        self.order = order
    }
    
    func updateCompletion() -> NoteModel {
        return NoteModel(id: id, taskDescription: taskDescription, isComplete: !isComplete, order: order)
    }
}

