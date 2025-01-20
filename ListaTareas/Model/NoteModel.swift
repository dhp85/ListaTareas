//
//  IntroPageItem.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

struct NoteModel: Codable, Identifiable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
    
}


