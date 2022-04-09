//
//  View.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

extension View {
    
    /**
     - Returns: View horizontally aligned to the leading edge.
     */
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /**
     - Returns: View horizontally centered.
     */
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    /**
     - Returns: View horizontally aligned to the trailing edge.
     */
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    /**
     - Returns: View vertically centered.
     */
    func vCenter() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .center)
    }
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
}

struct AutofocusViewModifier: ViewModifier {
    @FocusState private var quoteFieldIsFocused: Bool

    func body(content: Content) -> some View {
        content
            .focused($quoteFieldIsFocused)
            .onAppear {
                // https://developer.apple.com/forums/thread/681962?answerId=680723022#680723022
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.quoteFieldIsFocused = true
                }
            }
    }
}

extension TextField {
    func autofocus() -> some View {
        self.modifier(AutofocusViewModifier())
    }
}

extension TextEditor {
    func autofocus() -> some View {
        self.modifier(AutofocusViewModifier())
    }
}

