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
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
}
