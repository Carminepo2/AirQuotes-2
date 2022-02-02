//
//  CollectionsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionsListView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: Settings.CollectionViewsPerRow)
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                CollectionView(name: "Test", color: Color("TagPink"), systemName: "heart.fill")
                CollectionView(name: "Test", color: Color("TagRed"), systemName: "heart.fill")
                CollectionView(name: "Test", color: Color("TagGreen"), systemName: "heart.fill")
                CollectionView(name: "Test", color: Color("TagPink"), systemName: "heart.fill")
                CollectionView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                CollectionView(name: "Test", color: Color("TagBlue"), systemName: "heart.fill")
                
            }
            .padding()
            Spacer()
        }
    }
}

struct CollectionsListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsListView()
    }
}
