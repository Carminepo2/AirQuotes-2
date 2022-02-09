//
//  FavoritesListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 09/02/22.
//

import SwiftUI

struct FavoritesListView: View {
    @State private var searchText = ""
    @EnvironmentObject var Controller: StoreAirQuotes
    
    private var quotes: Array<Quote> {
        if searchText.isEmpty {
            return Controller.getFavorites()
        }
        return Controller.getFavorites()
            .filter { ($0.text ?? Settings.DefaultName).contains(searchText) }
    }
    
    var body: some View {
        Group {
            if quotes.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                List(quotes, id: \.self) {
                    Text($0.text ?? Settings.DefaultName)
                }
            }
        }
        .navigationTitle("Collections")
        .searchable(text: $searchText)
    }
    
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
