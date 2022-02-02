//
//  BrowseView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct BrowseView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollableTabView(["Collections", "Tags", "Favorites"]) {
            CollectionsListView()
            Text("Tags")
            Text("Favorites")
        }
        .searchable(text: $searchText)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

