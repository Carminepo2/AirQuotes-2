//
//  CollectionsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionsListView: View {
    @State private var searchText = ""

    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: Settings.CollectionViewsPerRow)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                CollectionItemView(name: "Test", color: Color("TagRed"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagGreen"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagPink"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionItemView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")

            }
            .padding()
        }
        .navigationTitle("Collections")
        .searchable(text: $searchText)
    }
}

struct CollectionsListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsListView()
    }
}
