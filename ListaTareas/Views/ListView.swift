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
                ForEach (vm.note) {item in
                    ListRowView(task: item)
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
    
    ListView()
        .environment(ListViewModel())
}
