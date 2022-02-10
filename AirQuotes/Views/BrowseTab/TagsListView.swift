//
//  TagsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 10/02/22.
//

import SwiftUI

struct TagsListView: View {
    @State private var searchText = ""
    @EnvironmentObject var Controller: StoreAirQuotes
    
    private var tags: Array<Tag> {
        if searchText.isEmpty {
            return Controller.getAllTags()
        }
        return Controller.getAllTags()
            .filter { ($0.title ?? Settings.DefaultName).contains(searchText) }
    }

    var body: some View {
        Group {
            if tags.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                List(tags, id: \.self) {
                    Text($0.title ?? Settings.DefaultName)
                }
            }
        }
        .navigationTitle("Favorites")
        .searchable(text: $searchText)
    }
}

struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        TagsListView()
    }
}
