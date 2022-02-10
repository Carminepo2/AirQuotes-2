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
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                 .environmentObject(controller)
                 .onChange(of: scenePhase){ _ in
                     CoreDataManager.shared.save()
                 }
        }
    }
}
