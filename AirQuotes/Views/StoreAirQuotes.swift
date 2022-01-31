//
//  StoreAirQuotes.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import SwiftUI

class StoreAirQuotes:ObservableObject{
    @Published var model:ModelAirQuotes
    static let shared = StoreAirQuotes()
    
    
    private init(){
        model = ModelAirQuotes()
    }
    
    
    
}
