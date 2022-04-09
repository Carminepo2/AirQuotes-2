//
//  ContentView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//
//hsghusnhci
import SwiftUI

struct ContentView: View {    

    @State var selectedTab: Tab = .latest
    
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .browse:
                NavigationView {
                    BrowseView()
                        .navigationTitle(Tab.browse.rawValue)
                }
                
            case .latest:
                NavigationView {
                    LatestView()
                        .navigationTitle(Tab.latest.rawValue)
                }
                
            }
            
            VStack {
                Spacer()
                CustomTabView(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.bottom)            
                
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
