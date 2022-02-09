//
//  CollectionsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionsListView: View {
    @State private var searchText = ""
    @EnvironmentObject var Controller: StoreAirQuotes
    
    private var collections: Array<Folder> {
        if searchText.isEmpty {
            return Controller.getAllFolders()
        }
        return Controller.getAllFolders().filter { ($0.name ?? Settings.DefaultName).contains(searchText) }
    }
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: Settings.CollectionHSpacing), count: Settings.CollectionViewsPerRow)
    
    var body: some View {
        Group {
            if collections.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: Settings.CollectionVSpacing) {
                        ForEach(collections, id:\.self){ collection in
                            CollectionItemView(
                                name: collection.name ?? Settings.DefaultName,
                                color: Color(collection.color!),
                                systemName:collection.icon!,
                                id: collection.id
                            )
                        }
                    }
                    .padding()
                }
            }
        }        .navigationTitle("Collections")
            .searchable(text: $searchText)
    }
}

struct CollectionsListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsListView()
            .environmentObject(StoreAirQuotes.shared)
    }
}
