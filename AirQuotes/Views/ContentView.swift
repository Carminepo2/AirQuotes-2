//
//  ContentView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//
//hsghusnhci
import SwiftUI

struct ContentView: View {    
    var body: some View {
        
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
                BrowseView()
                    .navigationTitle("Browse")
            }
            .tabItem {
                Image(systemName: "books.vertical.fill")
                Text("Browse")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
            .environmentObject(StoreAirQuotes.shared)
        ContentView().preferredColorScheme(.dark)
            .environmentObject(StoreAirQuotes.shared)
    }
}
