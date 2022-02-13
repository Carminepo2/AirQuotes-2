//
//  FavoritesListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 09/02/22.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var Controller: StoreAirQuotes
    
    var body: some View {
        QuotesListView(quotes: Controller.getFavorites())
        .navigationTitle("Favorites")

    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
            .environmentObject(StoreAirQuotes.shared)

    }
}
