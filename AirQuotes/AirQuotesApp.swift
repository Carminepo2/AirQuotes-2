//
//  AirQuotesApp.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

@main
struct AirQuotesApp: App {
    
     @StateObject var controller = StoreAirQuotes.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                 .environmentObject(controller)
        }
    }
}
