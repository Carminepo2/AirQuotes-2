//
//  CollectionsSliderView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 09/02/22.
//

import SwiftUI

struct CollectionsSliderView: View {
    @EnvironmentObject var store: StoreAirQuotes

    
    private var collections: Array<Folder> {
        return store.getLatestFolder()
    }
    
    var body: some View {
        Group {
            if !collections.isEmpty {
                TabView {
                    ForEach(collections.chunked(into: 2), id: \.first) { collectionsPair in
                        HStack(spacing: Settings.CollectionHSpacing) {
                            
                            CollectionItemView(collection: collectionsPair[0])

                            
                            if collectionsPair.indices.contains(1) {
                                
                                CollectionItemView(collection: collectionsPair[1])
                                
                            } else {
                                CollectionItemView(collection: nil)
                                    .opacity(0)
                                    .disabled(true)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: Settings.LatestCollectionsHeight, alignment: .top)
            } else {
                Text(Settings.EmptyStateMessage)
                    .foregroundColor(.secondary)
                    .frame(height: Settings.LatestCollectionsHeight / 2)
            }
        }

    }
}

struct CollectionsSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsSliderView()
            .environmentObject(StoreAirQuotes.shared)

        CollectionsSliderView()
            .preferredColorScheme(.dark)
            .environmentObject(StoreAirQuotes.shared)
        
    }
}
