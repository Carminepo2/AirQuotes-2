//
//  MultipleSelectionRowView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct MultipleSelectionRowView: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct MultipleSelectionRowView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRowView(title: "Test selected", isSelected: true, action: { })
        MultipleSelectionRowView(title: "Test not selected", isSelected: false, action: { })
    }
}
