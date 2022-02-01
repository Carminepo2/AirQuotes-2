//
//  CollectionView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        VStack {
            ScrollableTabView(["Collections", "Tags", "Favorites"]) {
                Text("Collections")
                Text("Tags")
                Text("Favorites")
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

