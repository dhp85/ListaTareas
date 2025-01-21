//
//  IntroPageItem.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import Foundation

struct NoteModel: Codable, Identifiable {
    let id: String
    var isComplete: Bool
    var description: String
    
}


