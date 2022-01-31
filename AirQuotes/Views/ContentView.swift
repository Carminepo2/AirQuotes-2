//
//  ContentView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            // MARK: - Background Color
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            TabView {
                //MARK: - Latest View Tab
                NavigationView {
                    LatestView()
                        .navigationTitle("Latest")
                }
                .tabItem {
                    Image(systemName: "text.quote")
                    Text("Latest")
                }
                
                //MARK: - Collection View Tab
                NavigationView {
                    CollectionView()
                        .navigationTitle("Collection")
                }
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Collection")
                }
                
            }
            .searchable(text: $searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}
