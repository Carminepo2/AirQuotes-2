//
//  HomeView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct LatestView: View {
    
    var body: some View {
        ScrollView {
            // MARK: - Quote Slider
            LatestViewSection("Latest quotes") {
                QuoteSliderView()
            }
            
            
            // MARK: - Add Quote Button
            Button(action: addQuote) {
                Label("Add Quote", systemImage: "pencil")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding()

            
            // MARK: - Quote Slider
            LatestViewSection("Latest collections") {
                // TODO
            } button: {
                Button(action: addCollection) {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
    
    //MARK: - Functions
    
    func addQuote() { }
    
    func addCollection() { }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
        
        LatestView()
            .preferredColorScheme(.dark)
    }
}
