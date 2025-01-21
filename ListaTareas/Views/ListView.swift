//
//  ListView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) var vm
    
    var body: some View {
        NavigationView{
            List {
                ForEach (vm.notes) {item in
                    ListRowView(task: item)
                        .onTapGesture {
                            vm.toggleCompletion(note: item)
                        }
                }
                .onDelete(perform: vm.deleteTask)
                .onMove(perform: vm.moveTask)
                
                
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
    let item1 = NoteModel(description: "Ir a por el coche", isComplete: true)
    let item2 = NoteModel(description: "Hacer la comida", isComplete: false)
    let item3 = NoteModel(description: "Recoger a los niños", isComplete: false)
    ListView()
        .environment(ListViewModel(notes: [item1,item2,item3]))
}
