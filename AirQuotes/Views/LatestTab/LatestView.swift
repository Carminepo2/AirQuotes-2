//
//  HomeView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct LatestView: View {
    @State private var showQuoteForm = false
    @State private var showCollectionForm = false
    
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            // MARK: - Quote Slider
            LatestSectionView("Latest quotes") {
                QuoteSliderView()
            }
            
            
            // MARK: - Add Quote Button
            Button(action: newQuoteButtonTapped) {
                Label("New Quote", systemImage: "pencil")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding()

            
            // MARK: - Quote Slider
            LatestSectionView("Latest collections") {
                // TODO
            } button: {
                Button(action: newCollectionButtonTapped) {
                    Label("Add", systemImage: "plus.circle")
                }
            }
        }
        .searchable(text: $searchText)
        
        // MARK: Modals
        .sheet(isPresented: $showCollectionForm, content: { CollectionFormView() })
        .sheet(isPresented: $showQuoteForm, content: { QuoteFormView() })
    }
    
    //MARK: - Functions
    
    private func newQuoteButtonTapped() { showQuoteForm = true }
    private func newCollectionButtonTapped() { showCollectionForm = true }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
        
        LatestView()
            .preferredColorScheme(.dark)
    }
}

