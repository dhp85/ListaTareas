//
//  ListView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

struct ListView: View {
    @State var descriptionNote: [NoteModel] = []
    
    var body: some View {
        NavigationView{
            List {
                ForEach (descriptionNote) {item in
                    ListRowView(task: item)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Mis Tareas 📝")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: AddView())
            )
        }
    }
}

#Preview {
    let item1 = NoteModel(id: "1", isComplete: true, description: "Llamar al medico")
    let item2 = NoteModel(id: "2", isComplete: true, description: "Ir a por el coche")
    ListView(descriptionNote: [item1, item2])
}
