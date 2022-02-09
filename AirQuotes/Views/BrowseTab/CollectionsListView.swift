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
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: Settings.CollectionViewsPerRow)
    
    var body: some View {
        Group {
            if collections.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(collections, id:\.self){ aCollection in
                            CollectionItemView(name: aCollection.name ?? Settings.DefaultName, color: Color(aCollection.color!), systemName:aCollection.icon!)
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
