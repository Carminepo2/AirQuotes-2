//
//  BrowseView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        List {

            NavigationLink(destination: CollectionsListView()) {
                Label("Collections", systemImage: "square.grid.2x2")
            }
            
            NavigationLink(destination: EmptyView()) {
                Label("Tags", systemImage: "tag")
            }
            
            NavigationLink(destination: FavoritesListView()) {
                Label("Favorites", systemImage: "heart")
            }
            
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

