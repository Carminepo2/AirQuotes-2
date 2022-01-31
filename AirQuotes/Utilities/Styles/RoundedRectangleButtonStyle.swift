//
//  RoundedRectangleButtonStyle.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI


struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.accentColor)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
