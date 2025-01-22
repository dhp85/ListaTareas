//
//  ListaTareasApp.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

@main
struct ListaTareasApp: App {
    
    @State var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(listViewModel)
                
        }
        .modelContainer(for: NoteModel.self)
    }
}
