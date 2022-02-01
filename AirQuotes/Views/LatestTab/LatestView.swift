//
//  HomeView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct LatestView: View {
    @State private var showQuoteForm = false
    
    var body: some View {
        ScrollView {
            // MARK: - Quote Slider
            LatestSectionView("Latest quotes") {
                QuoteSliderView()
            }
            
            
            // MARK: - Add Quote Button
            Button(action: openQuoteFormModal) {
                Label("Add Quote", systemImage: "pencil")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding()

            
            // MARK: - Quote Slider
            LatestSectionView("Latest collections") {
                // TODO
            } button: {
                Button(action: addCollection) {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showQuoteForm, content: { QuoteFormView() })
    }
    
    //MARK: - Functions
    
    func openQuoteFormModal() { showQuoteForm = true }
    
    func addCollection() { }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
        
        LatestView()
            .preferredColorScheme(.dark)
    }
}

