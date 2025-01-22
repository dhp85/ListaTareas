//
//  ListView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI


struct ListView: View {
    @Environment(\.modelContext) var context
    @Environment(ListViewModel.self) var vm
    
    var body: some View {
        NavigationView{
            List {
                ForEach (vm.notes) {item in
                    ListRowView(task: item)
                        .onTapGesture {
                            vm.toggleCompletion(note: item, context: context)
                        }
                }
                .onDelete(perform: vm.delete)
                .onMove { from, to in
                    vm.moveTask(from: from, to: to, context: context)
                }
               
            }
            .listStyle(.plain)
            .navigationTitle("Mis Tareas 📝")
            .navigationBarItems(leading: EditButton(),
                                trailing:
                                    NavigationLink("Add", destination: AddView())
            )
            .onAppear {
                vm.modelContext = context
                vm.loadNotes()
            }
            
        }
    }
}

#Preview {
    let item1 = NoteModel(taskDescription: "Ir a por el coche", isComplete: true)
    let item2 = NoteModel(taskDescription: "Hacer la comida", isComplete: false)
    let item3 = NoteModel(taskDescription: "Recoger a los niños", isComplete: false)
    ListView()
        .environment(ListViewModel(notes: [item1,item2,item3]))
}
