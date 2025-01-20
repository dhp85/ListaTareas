//
//  ListRowView.swift
//  ListaTareas
//
//  Created by Diego Herreros Parron on 20/1/25.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "Este es el primer item" )
}
