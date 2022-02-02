//
//  ColorButtonView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct ColorButtonView: View {
    let colorName: String
    @Binding var chosenColor: String
    
    private let buttonSize: CGFloat = 40
    
    var isChosen: Bool {
        chosenColor == colorName
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(colorName))
                .frame(width: buttonSize, height: buttonSize)
                .onTapGesture(perform: buttonTapped)
                .padding(10)
            
            if isChosen {
                Circle()
                    .stroke(Color(colorName), lineWidth: 5)
                    .frame(width: buttonSize + 10, height: buttonSize + 10)
            }
        }
    }
    
    // MARK: - Functions
    func buttonTapped() {
        withAnimation {
            chosenColor = colorName
        }
    }
}

struct ColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ColorButtonView(colorName: "TagBlue", chosenColor: .constant("TagBlue"))
            ColorButtonView(colorName: "TagBlue", chosenColor: .constant("TagPink"))
        }
    }
}
