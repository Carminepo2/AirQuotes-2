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
            LatestSectionView("Latest quotes") {
                QuoteSliderView()
            }
            
            
            // MARK: - Collections Slider
            LatestSectionView("Latest collections") {
                CollectionsSliderView()
                    .padding(.top, -16)
            }
            .padding(.bottom, 20)
            .padding(.top)

        }
    }
        
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView()
            .environmentObject(StoreAirQuotes.shared)
        LatestView()
            .preferredColorScheme(.dark)
            .environmentObject(StoreAirQuotes.shared)

    }
}

