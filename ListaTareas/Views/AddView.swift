//
//  AddView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 21/1/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(ListViewModel.self) var vm
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    TextField("Escribe la tarea aqui...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color(.lightGray).opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    
                    Button("Agregar Tarea") {
                        saveButtonTap()
                        
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .clipShape(.buttonBorder)
                    
                    
                }
                .navigationTitle("Añade una Tarea 🖋️")
            }
            .padding(16)
        }
    }
    
    func saveButtonTap() {
        vm.addtask(task: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}
#Preview {
    AddView()
        .environment(ListViewModel())
}
