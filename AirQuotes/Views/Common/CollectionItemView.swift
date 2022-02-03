//
//  CollectionItemView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionItemView: View {
    let name: String
    let color: Color
    let systemName: String
    
    var body: some View {
        
        VStack {
            CollectionItemRectView(name: name, color: color, systemName: systemName)
            
            HStack {
                Text(name)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}


struct CollectionItemRectView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let name: String
    let color: Color
    let systemName: String

    var body: some View {
        let shadowColorOpacity = colorScheme == .dark ? Settings.ShadowColorOpacityDarkMode : Settings.ShadowColorOpacityLightMode

        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: Settings.CornerRadius)
                    .fill(color)
                    .aspectRatio(1/1, contentMode: .fit)
                    .shadow(color: color.opacity(shadowColorOpacity), radius: Settings.ShadowRadius)
                Image(systemName: systemName)
                    .foregroundStyle(.tertiary)
                    .font(Font.system(size: size(thatFits: geometry.size)))
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func size(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) * Settings.CollectionIconScaleFactor
    }
}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            CollectionItemView(name: "Lorem ipsum Lorem ipsum Lorem ipsum", color: Color("TagGreen"), systemName: "heart.fill")
            CollectionItemView(name: "Lorem ipsum", color: Color("TagRed"), systemName: "heart.fill")
        }
        .padding()
        VStack {
            HStack(spacing: 20) {
                CollectionItemView(name: "Lorem ipsum", color: Color("TagGreen"), systemName: "heart.fill")
                CollectionItemView(name: "Lorem ipsum", color: Color("TagRed"), systemName: "heart.fill")
            }
            HStack(spacing: 20) {
                CollectionItemView(name: "Lorem ipsum", color: Color("TagGreen"), systemName: "heart.fill")
                CollectionItemView(name: "Lorem ipsum", color: Color("TagRed"), systemName: "heart.fill")
            }
        }
        .preferredColorScheme(.dark)
    }
}
