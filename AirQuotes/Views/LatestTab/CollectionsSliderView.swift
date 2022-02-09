//
//  CollectionsSliderView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 09/02/22.
//

import SwiftUI

struct CollectionsSliderView: View {
    @EnvironmentObject var Controller: StoreAirQuotes
    
    private var collections: Array<Folder> {
        return Controller.getAllFolders()
    }
    
    var body: some View {
        Group {
            if !collections.isEmpty {
                TabView {
                    ForEach(collections.chunked(into: 2), id: \.first) { collectionsPair in
                        HStack(spacing: Settings.CollectionHSpacing) {
                            
                            CollectionItemView(
                                name: collectionsPair[0].name ?? Settings.DefaultName,
                                color: Color(collectionsPair[0].color!),
                                systemName: collectionsPair[0].icon!,
                                id: collectionsPair[0].id
                            )
                            
                            if collectionsPair.indices.contains(1) {
                                
                                CollectionItemView(
                                    name: collectionsPair[1].name ?? Settings.DefaultName,
                                    color: Color(collectionsPair[1].color!),
                                    systemName: collectionsPair[1].icon!,
                                    id: collectionsPair[1].id
                                )
                                
                            } else {
                                CollectionItemView(name: "", color: Color.clear, systemName: "")
                                    .opacity(0)
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
        CollectionsSliderView()
            .preferredColorScheme(.dark)
        
        
    }
}
