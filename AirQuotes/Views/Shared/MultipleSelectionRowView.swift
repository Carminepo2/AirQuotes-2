//
//  MultipleSelectionRowView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct MultipleSelectionRowView<T>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let label: String
    let data: T
    var isSelected: Bool
    var action: (T) -> Void

    var body: some View {
        Button(action: { self.action(data) }) {
            HStack {
                Text(self.label)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
            .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}

struct MultipleSelectionRowView_Previews: PreviewProvider {
    

    static var previews: some View {

        MultipleSelectionRowView(label: "Test selected", data: "1",  isSelected: true, action: { (_ a: String) in  })
        MultipleSelectionRowView(label: "Test not selected", data: "2", isSelected: false, action: { (_ a: String) in  })
            .preferredColorScheme(.dark)
    }
}
