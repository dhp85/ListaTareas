//
//  ListRowView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

struct ListRowView: View {
    
    let task: NoteModel
    
    var body: some View {
        
        HStack {
            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(task.isComplete ? .green : .red)
            Text(task.description)
            Spacer()
        }
    }
}

#Preview {
    let item = NoteModel(description: "Ir a recoger el coche", isComplete: false)
    ListRowView(task: item)
}
