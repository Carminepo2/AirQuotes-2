//
//  MultipleSelectionRowView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct MultipleSelectionRowView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var title: String
    var isSelected: Bool
    var action: (String) -> Void

    var body: some View {
        Button(action: { self.action(title) }) {
            HStack {
                Text(self.title)
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

        MultipleSelectionRowView(title: "Test selected", isSelected: true, action: { (_ a: String) in  })
        MultipleSelectionRowView(title: "Test not selected", isSelected: false, action: { (_ a: String) in  })
            .preferredColorScheme(.dark)
    }
}
