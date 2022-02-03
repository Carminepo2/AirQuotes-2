//
//  IconSelectionView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 03/02/22.
//

import SwiftUI

struct IconSelectionView: View {
    @Binding var chosenIcon: String
    
    var body: some View {
        VStack {
            ForEach(Settings.CollectionIcons.chunked(into: 4), id: \.first) { chunk in
                HStack{
                    ForEach(chunk, id: \.self) { iconName in
                        IconButtonView(iconName: iconName, chosenIcon: $chosenIcon)
                    }
                }
            }
        }
    }
}

fileprivate struct IconButtonView: View {
    let iconName: String
    @Binding var chosenIcon: String
    
    private let buttonSize: CGFloat = Settings.SelectionFormButtonSize
    
    var isChosen: Bool {
        chosenIcon == iconName
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(UIColor.systemGray6))
                .frame(width: buttonSize, height: buttonSize)
                .onTapGesture(perform: buttonTapped)
                .padding(10)
                .overlay(Image(systemName: iconName).font(.title2).opacity(0.8))
            
            if isChosen {
                Circle()
                    .stroke(.selection, lineWidth: 5)
                    .frame(width: buttonSize + 10, height: buttonSize + 10)
            }
        }
    }
    
    // MARK: - Functions
    private func buttonTapped() {
        chosenIcon = iconName
    }
}

struct IconSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        IconSelectionView(chosenIcon: .constant("heart.fill"))
        IconSelectionView(chosenIcon: .constant("heart.fill"))
            .preferredColorScheme(.dark)
        
        IconSelectionView(chosenIcon: .constant("heart.fill"))
            .previewDevice("iPhone SE (1st generation)")
    }
}
