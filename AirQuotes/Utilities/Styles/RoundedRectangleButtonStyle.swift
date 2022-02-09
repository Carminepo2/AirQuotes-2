//
//  RoundedRectangleButtonStyle.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI


struct RoundedRectangleButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(colorScheme == .dark ? Color(uiColor: .systemGray6) : Color.accentColor)
        .cornerRadius(Settings.CornerRadius)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}


struct RoundedRectangleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test", action: {})
            .buttonStyle(RoundedRectangleButtonStyle())
        
        Button("Test", action: {})
            .buttonStyle(RoundedRectangleButtonStyle())
            .preferredColorScheme(.dark)

    }
}

