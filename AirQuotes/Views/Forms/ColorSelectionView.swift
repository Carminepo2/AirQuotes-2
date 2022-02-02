//
//  ColorSelectionView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct ColorSelectionView: View {
    @Binding var chosenColor: String
    
    var body: some View {
        HStack{
            ColorButtonView(colorName: "TagRed", chosenColor: $chosenColor)
            ColorButtonView(colorName: "TagGreen", chosenColor: $chosenColor)
            ColorButtonView(colorName: "TagPink", chosenColor: $chosenColor)
            ColorButtonView(colorName: "TagBlue", chosenColor: $chosenColor)
        }
        .padding(.horizontal)
        .padding(.horizontal)    }
}

fileprivate struct ColorButtonView: View {
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
    private func buttonTapped() {
        withAnimation {
            chosenColor = colorName
        }
    }
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView(chosenColor: .constant("TagRed"))
    }
}
