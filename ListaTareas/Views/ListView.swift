//
//  ListView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

struct ListView: View {
    @State var descriptionNote: String = ""
    
    var body: some View {
        NavigationView{
            List {
                ListRowView(title: "Este es el primer item")
            }
            .listStyle(.plain)
            .navigationTitle("Mis Tareas 📝")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: Text("Destination"))
            )
        }
    }
}

#Preview {
    ListView()
}
